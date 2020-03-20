module TestPassagesHelper
  def percent(test_passage)
    (test_passage.correct_questions.to_f / test_passage.test.questions.count * 100).to_i
  end

  def show_result
    if percent(@test_passage) >= 85
      "Congratulations! You have passed the test."
    else
      "You haven't passed the test."
    end
  end

  def h2_class
    if percent(@test_passage) >= 85
      "green"
    else
      "red"
    end
  end
end
