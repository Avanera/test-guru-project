class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true

  validate :validate_max_answers

  private

  def validate_max_answers  
    errors.add(:base, "can't be more than 4 answers") if self.question.answers.size > 4
  end
end
