class Badge < ApplicationRecord

  BADGES_AWARD = {
    category_complete: 'pass all tests of any certain category',
    first_try: 'pass any test on the first try',
    level_complete: 'pass all tests of any certain level'
  }.freeze

  has_many :badge_users
  has_many :users, through: :badge_users
  has_one_attached :image
  belongs_to :category, optional: true

  def rule_description
    BADGES_AWARD[rule.to_sym]
  end
end
