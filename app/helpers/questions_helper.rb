module QuestionsHelper

  def question_header(question)
    if question.persisted?
      "Edit #{@test.title} Question"
    else
      "Create New #{@test.title} Question"
    end
  end
end
