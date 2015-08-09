module SessionsHelper

  def login(user)
  	session[:id] = user.id
  end

  def current_user
  	@current_user ||= User.find_by(id:session[:id])
  end
  
  def is_logged_in?
  	!current_user.nil?
  end

  def logout
	session.delete(:user_id)
	@current_user = nil
  end


end
