module QuestionsHelper

  def question_header(test)
    if request.url.include? "edit"
      render plain: "Edit #{@test.title} Question"
    elsif request.url.include? "new"
      render plain: "Create New #{@test.title} Question"
    end
  end
end
