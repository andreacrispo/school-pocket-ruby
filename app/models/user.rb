class User < ActiveRecord::Base
  has_many :subjects,     dependent: :destroy
  has_many :grades,       dependent: :destroy
  has_many :homeworks,    dependent: :destroy


  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password


end
