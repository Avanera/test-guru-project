class Test < ApplicationRecord
  def self.titles_of_category(category)
    where(category_id: category).order(title: :desc).select(:title)
  end
end
