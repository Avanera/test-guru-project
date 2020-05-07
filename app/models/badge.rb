class Badge < ApplicationRecord

  BADGES_AWARD = {
    'Passing all tests of the category' => :category_complete,
    'Passing the test on the first try' => :first_try,
    'Passing all tests of a certain level' => :level_complete,
    'Passing test sucessfully' => :successful_test
  }.freeze

  has_many :badge_users
  has_many :users, through: :badge_users
  has_one_attached :image
  belongs_to :category, optional: true
end
