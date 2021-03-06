class TestPassage < ApplicationRecord

  PASSAGE_PERCENTAGE_OF_CORRECT_ANSWERS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def success?
    return false if test.timer && time_is_out?
    percent_of_corrent_answers >= PASSAGE_PERCENTAGE_OF_CORRECT_ANSWERS
  end

  def percent_of_corrent_answers
    (correct_questions.to_f / test.questions.count * 100).to_i
  end

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def time_is_out?
    passage_time >= test.timer
  end

  def passage_time
    (Time.now.utc - created_at.utc).to_i
  end

  private

  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    #correct_answers.ids.sort == answer_ids.map(&:to_i).sort

    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
