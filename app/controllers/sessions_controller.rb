class SessionsController < ApplicationController
  def new; end

  def create
   user = User.find_by(email: session_params[:email])

   if user && user.authenticate(session_params[:password])
     session[:user_id] = user.id

     flash[:notice] = "Login successful"
     redirect_to '/'
   else
     flash[:alert] = "Invalid Email or Password"
     redirect_to '/signin'
   end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/signin'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
