class Test < ApplicationRecord
  has_many :test_passages
  has_many :users, through: :test_passages
  has_many :questions
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", foreign_key: 'user_id', optional: true

  validates :title, presence: true,
                    uniqueness: { scope: :level, message: 'with this level already exists' }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }

  scope :find_by_category_title, -> (category_title) { joins(:category).where(categories: { title: category_title }) }
  
  def self.titles_of_category(category_title)
    find_by_category_title(category_title).order(title: :desc).pluck(:title)
  end
end
