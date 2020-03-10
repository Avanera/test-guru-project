class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :tests
  def tests_of_level(level)
    Test.joins("JOIN tests_users ON tests.id = tests_users.test_id")
    .where('level = ? AND user_id = ?', level, self.id)
    .pluck('title')
  end
end
