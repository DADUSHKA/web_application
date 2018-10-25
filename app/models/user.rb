class User < ApplicationRecord

  has_many :questions
  has_many :test, through: :questions

  def list_of_user_tests_by_difficulty(value)
    Test.where(level: value).pluck(:title).join("' , '")
  end

end
