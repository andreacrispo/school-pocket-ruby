class HomeworksController < ApplicationController

  before_action :authenticate_user

  # get /homeworks
  def index
    @homeworks = current_user.homeworks
    @homework = Homework.new 
    respond_to do |format|
        format.html
        format.json { 
          render json: @homeworks.to_json(:include => { :subject => { :only => :name }})
        }
    end
  end

  def show
  end

  # get /homeworks/new
  def new
    @homework = Homework.new
    # render homework form
  end

  # post /homeworks
  def create
     @homework = current_user.homeworks.build(homework_params)
      if @homework.save
        flash.now[:success] = "Homework added"
        redirect_to homeworks_url
      else
        render 'new'
      end
  end



  # /get /homeworks/<id>/edit
  def edit
     @homework = Homework.find( params[:id])
     # render homework form
  end

  # /patch /homework/<id>
  def update
    @homework = Homework.find( params[:id])
    if @homework.update_attributes( homework_params )
       flash[:success] = "Homework update"
       redirect_to homeworks_url
    else
      flash.now[:danger] = "Error"
      render 'edit'
    end
  end

  # /delete homeworks/<id>
  def destroy
    Homework.find(params[:id]).destroy
    #flash[:success] = "Homework deleted"
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  # /patch homeworks/<id>/toggle_complete
  def toggle_complete
    @homework = Homework.find(params[:id])
    @homework.toggle!(:completed)
    respond_to do |format|
      format.html { redirect_to homeworks_url }
      format.json { head :no_content }
    end
  end


  private
    def homework_params
      params.require(:homework).permit(:description, :subject_id, :deadline, :priority)
    end


end
