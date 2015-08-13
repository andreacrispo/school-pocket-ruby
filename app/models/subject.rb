class Subject < ActiveRecord::Base
  belongs_to :user
  
  has_many :grades,     dependent: :destroy
  has_many :homeworks,  dependent: :destroy
 
  validates :name, presence: true
  
end
