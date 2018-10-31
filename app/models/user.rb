class User < ApplicationRecord

  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :author_tests, class_name: 'Test', foreign_key: "author_id"

  def list_of_user_tests_by_difficulty(value)
    tests.where(tests: {level: value})
  end

end
