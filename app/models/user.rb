class User < ApplicationRecord
  def tests_of_level(level)
    Test.joins("JOIN tests_users ON tests.id = tests_users.test_id")
    .where('level = ? AND user_id = ?', level, self.id)
    .pluck('title')
  end
end
