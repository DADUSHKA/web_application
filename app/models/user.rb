class User < ApplicationRecord

  def list_of_user_tests_by_difficulty(value)
    Test.where(level: value).pluck(:title).join("' , '")
  end

end
