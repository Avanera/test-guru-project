class Test < ApplicationRecord
  def self.titles_of_category(category)
    joins("JOIN categories ON tests.category_id = categories.id")
    .where("categories.title = ?", category).order(title: :desc).pluck(:title)
  end
end
