class SubjectsController < ApplicationController
  
  before_action :authenticate_user
  
  # get /subjects
  def index
    @subjects = Subject.all
  end

  def show
  end

  # get /subjects/new 
  def new
    # render subject form
  end
  
  # post /subjects
  def create
  	
  end

  def destroy
  	
  end

end
