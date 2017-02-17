class SubjectsController < ApplicationController

  before_action :authenticate_user

  # get /subjects
  def index
    @subjects = current_user.subjects
      @subject = Subject.new 
  end

  def show
  end

  # get /subjects/new
  def new
    @subject = Subject.new
    # render subject form
  end

  # post /subjects
  def create
     @subject = current_user.subjects.build(subject_params)
      if @subject.save
        flash.now[:success] = "Subject added"
        redirect_to subjects_url
      else
        render 'new'
      end
  end



  # /get /subjects/<id>/edit
  def edit
     @subject = Subject.find( params[:id])
     # render subject form
  end

  # /patch /subject/<id>
  def update
    @subject = Subject.find( params[:id])
    if @subject.update_attributes( subject_params )
       flash[:success] = "Subject update"
       redirect_to subjects_url
    else
      flash.now[:danger] = "Error"
      render 'edit'
    end
  end

  # /delete subjects/<id>
  def destroy
    Subject.find(params[:id]).destroy
    flash[:success] = "Subject deleted"
    redirect_to request.referrer
  end


  private
    def subject_params
      params.require(:subject).permit(:name)
    end


end
