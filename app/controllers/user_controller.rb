class UserController < ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  skip_before_action :authenticate_user, only: [:new, :create]

  def new; end

  def create
    user = User.new(user_params)

    if user.save
      flash[:notice] = "Signup successful!"
      redirect_to '/signin'
    else
      flash[:alert] = "Please try again!"
      redirect_to '/signup'
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = "Update successful!"

      redirect_to '/account'
    else
      flash[:alert] = "Please try again!"

      redirect_to '/account'
    end
  end

  def destroy
    session[:user_id] = nil
    @user.destroy

    redirect_to '/'
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
