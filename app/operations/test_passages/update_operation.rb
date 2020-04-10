module TestPassages
  class UpdateOperation

    def initialize(params)
      @params = params
      @result = {success: true}
    end

    def call
      accept!

      if test_passage.completed?
        handle_completed_test_passage
      else
        @result[:success] = false
      end

      @result
    end

    private

    def accept!
      if correct_answer?
        test_passage.correct_questions += 1
      end

      test_passage.save!
    end

    def handle_completed_test_passage
      TestsMailer.completed_test(test_passage).deliver_now
    end

    def correct_answer?
      correct_answers_count = correct_answers.count

      (correct_answers_count == correct_answers.where(id: @params[:answer_ids]).count) &&
      correct_answers_count == @params[:answer_ids].count
    end

    def correct_answers
      test_passage.current_question.answers.correct
    end

    def test_passage
      TestPassage.find(@params[:id])
    end
  end
end
