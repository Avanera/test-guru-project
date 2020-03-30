class QuestionsController < ApplicationController

  before_action :find_test, only: %i[create new index]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
   # render inline: '<%= @questions.map { |question| question.body } %>'
    @questions = @test.questions
    respond_to do |format|
      format.json {render json: { questions: @questions } }
      format.html 
    end
  end

  def show

  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to @test
    else
      render 'new'
    end

  end

  def edit

  end

  def update
    if @question.update(question_params)
      redirect_to question_path
    else
      render :edit
    end
   # render plain: test.inspect
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  def new
    @question = @test.questions.new
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

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
