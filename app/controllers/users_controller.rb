class UsersController < ApplicationController
  
  # /get users/<id>
  def show
  	@user = User.find(params[:id])
  end

end
