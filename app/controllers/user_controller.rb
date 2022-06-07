class UserController < ApplicationController
  def show
  end

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      flash[:notice] = "Signup successful!"
      redirect_to '/signup'
    else
      flash[:alert] = "Please try again!"
      redirect_to '/signup'
    end
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
