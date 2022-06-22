module SigninHelper
  def signin_as(user)
    post signin_url({session: {email: user.email, password: user.password}})
  end
end
