class GradesController < ApplicationController

  before_action :authenticate_user

  # get /grades
  def index
    @grades = current_user.grades
    @grade = Grade.new
    @avg = GradesHelper.weighted_average(@grades)
    respond_to do |format|
        format.html
        format.json { 
          render json: @grades.to_json(:include => { :subject => { :only => :name }})
        }
    end
  end

  def show
  end

  # get /grades/new
  def new
    @grade = Grade.new
    # render grade form
  end

  # post /grades
  def create
     @grade = current_user.grades.build(grade_params)
      if @grade.save
        flash.now[:success] = "grade added"
        redirect_to grades_url
      else
        render 'new'
      end
  end



  # /get /grades/<id>/edit
  def edit
     @grade = Grade.find(params[:id])
     # render grade form
  end

  # /patch /grade/<id>
  def update
    @grade = Grade.find( params[:id])
    if @grade.update_attributes( grade_params )
       flash[:success] = "grade update"
       redirect_to grades_url
    else
      flash.now[:danger] = "Error"
      render 'edit'
    end
  end

  # /delete grades/<id>
  # /delete grades/<id>.json
  def destroy
    grade = Grade.find(params[:id])
    grade.destroy

    #flash[:success] = "grade deleted"
    respond_to do |format|
      format.html { redirect_to request.referrer }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    def grade_params
      params.require(:grade).permit(:grade,:date, :subject_id, :description, :credit)
    end



end
