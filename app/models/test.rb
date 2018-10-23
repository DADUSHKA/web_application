class Test < ApplicationRecord

  def self.tests_of_certain_categories(name_category)
    self.where(category_id: Category.where(title: name_category)
               .ids).order('id DESC').pluck(:title)
  end
end
