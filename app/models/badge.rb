class Badge < ApplicationRecord
  has_many :badge_users
  has_many :users, through: :badge_users
  has_one_attached :image
  belongs_to :category, optional: true
end
