class Homework < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :subject

  #PRIORITIES = { high: 0, medium: 1, low: 2 }

  validates :description, presence: true
  validates :subject_id, presence: true
  validates :deadline, presence: true
  validates :priority, presence: true

  def set_completed
  	true
  end


end
