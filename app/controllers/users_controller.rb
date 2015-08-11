class UsersController < ApplicationController

  before_action :authenticate_user 
  before_action :correct_user
  
  # /get users/<id>
  def show
  	@user = User.find(params[:id])
  end

end
