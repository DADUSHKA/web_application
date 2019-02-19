class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :confirmable,
         :trackable, :validatable

  has_many :test_passages
  has_many :gists, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :author_tests, class_name: 'Test', foreign_key: 'author_id'

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

def full_name
first_name + last_name
end

end
