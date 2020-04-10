class TestPassage < ApplicationRecord

  PASSAGE_PERCENTAGE_OF_CORRECT_ANSWERS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def success?
    percent_of_corrent_answers >= PASSAGE_PERCENTAGE_OF_CORRECT_ANSWERS
  end

  def percent_of_corrent_answers
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  def completed?
    current_question.nil?
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
