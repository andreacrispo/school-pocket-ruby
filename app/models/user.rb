class User < ActiveRecord::Base
  has_many :subjects,  dependent: :destroy

  validates :username,  presence: true, length: { maximum: 125 }
  validates :email, presence: true 
  
  has_secure_password 

end
