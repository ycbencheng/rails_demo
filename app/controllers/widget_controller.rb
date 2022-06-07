class WidgetController < ApplicationController
  before_action :set_user

  def index
    @widgets = @user&.widgets
  end

  def new; end

  def create
    widget = @user.widgets.new(widget_params)

    if widget.save
      flash[:notice] = "Widget created successful!"

      redirect_to widget_index_path
    else
      flash[:alert] = "Please try again!"

      render :new
    end
  end

  def edit
    correct_user = Widget.find(params[:id]).seller_id == @user.id

    if !correct_user
      flash[:notice] = "You do not have access"

      redirect_to root_path
    end
  end

  def update
    if @user.widgets.update(widget_params)
      flash[:notice] = "Update successful!"

      render :edit
    else
      flash[:alert] = "Please try again!"

      redirect_to widget_index_path
    end
  end

  def destroy
    @user.widgets.find(params[:id]).destroy

    redirect_to widget_index_path
  end

  private

  def set_user
    @user = current_user
  end

  def widget_params
    params.require(:widget).permit(:title, :description, :price)
  end
end
