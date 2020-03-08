class User < ApplicationRecord
  def tests_of(level)
    puts self.class
    .joins("INNER JOIN tests ON users.test_id = tests.id")
    .where('level = ? AND users.id = ?', level, self.id)
    .select('title')
  end
end
