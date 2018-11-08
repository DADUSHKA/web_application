class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { self.email = email.downcase }


  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: 'Test', foreign_key: "author_id"

  validates :name, :login_status, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 2 }

end
