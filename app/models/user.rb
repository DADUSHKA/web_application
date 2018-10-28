class User < ApplicationRecord

  has_and_belongs_to_many :tests

  def list_of_user_tests_by_difficulty(value)
    tests.where(level: value)
  end

end
