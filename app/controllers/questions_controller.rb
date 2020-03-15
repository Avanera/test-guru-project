class QuestionsController < ApplicationController

  before_action :find_test, only: %i[create new destroy index]
  before_action :find_question, only: %i[show]
  before_action :find_questions, only: %i[index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
   # render inline: '<%= @questions.map { |question| question.body } %>'
      respond_to do |format|
      format.json {render json: { tests: Test.all } }
      format.html 
    end
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def create
    question = @test.questions.create(question_params)

    render plain: question.inspect
  end

  def destroy
    question = @test.questions.find(params[:id])
    question.destroy
    redirect_to tests_path
  end

  def new

  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_questions
    @questions = Question.where("test_id = ?", params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
