class UsersController < ApplicationController

  before_action :authenticate_user
  before_action :correct_user
  skip_before_action :authenticate_user, only: [:new, :create]
  skip_before_action :correct_user, only:  [:new, :create]

  # /get users/<id>
  def show
  	@user = User.find(params[:id])
    @grades    =  @user.grades.count
    @subjects  =  @user.subjects.count
    @homeworks =  @user.homeworks.count
  end


  # /get users/new
  # Remapped in
  # /get signup
  def new
    @user = User.new
    # render subject form
  end


  # /post users/new
  # Remapped in
  # /post signup
  def create
    @user = User.new(user_params)
    if @user.save
      login @user
      flash[:success] = "Welcome to School Pocket!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password,
    :password_confirmation)
  end

end
