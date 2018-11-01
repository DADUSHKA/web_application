class Test < ApplicationRecord

  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions

  def self.tests_of_certain_categories(category_name)
    joins(:category).where(categories: { title: category_name }).pluck(:title)
    .order(created_at: :desc)
  end

end
