class SessionsController < ApplicationController
  
  # get /login
  def new
  	# Render login form page
  end

  # post /login
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) #authenticate provide by has_secure_passw
      login user
      redirect_to user
  	else
      flash.now[:danger] = 'Invalid email/password combination'
  	  render 'new'
  	end
  end

  # delete /logout
  def destroy
    logout
    redirect_to root_url
  end
  
end
