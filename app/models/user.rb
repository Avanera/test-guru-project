class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: "Test", foreign_key: :user_id

  validates :email, uniqueness: true,
                    format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/i

  def admin?
    is_a?(Admin)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def tests_of_level(level)
    Test.joins(:tests_users)
    .where(level: level)
    .where(tests_users: { user_id: self.id })
    .pluck('title')
  end

  # def tests_of_level(level)
  #   Test.joins("JOIN tests_users ON tests.id = tests_users.test_id")
  #   .where('level = ? AND user_id = ?', level, self.id)
  #   .pluck('title')
  # end
end
