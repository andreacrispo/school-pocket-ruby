class Grade < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  validates :grade,  presence: true
  validates :date,   presence: true 


end
