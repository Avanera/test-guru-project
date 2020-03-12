class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :tests_users
  has_many :users, through: :tests_users
  belongs_to :author, class_name: "User", foreign_key: 'user_id'

  validates :title, presence: true,
                    uniqueness: { scope: :level, message: 'with this level already exists' }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # validate :validate_max_level

  scope :easy, -> { where(level: (0..1)) }
  scope :medium, -> { where(level: (2..4)) }
  scope :hard, -> { where(level: (5..Float::INFINITY)) }

  scope :titles_of_category, -> (cat) { joins(:category).where(categories: { title: cat }).order(title: :desc).pluck(:title) }
  
  # def self.titles_of_category(category)
  #   joins("JOIN categories ON tests.category_id = categories.id")
  #   .where("categories.title = ?", category).order(title: :desc).pluck(:title)
  # end

  private

  def validate_max_level
      errors.add(:level) if level.to_i > 10
  end

  def ruby_test?
    title.match(/Ruby/i)
  end
end
