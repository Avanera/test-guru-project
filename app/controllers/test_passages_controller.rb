class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    @result = GistQuestionService.new(@test_passage.current_question).call
    create_gist_in_bd
    flash_notice
    redirect_to @test_passage, @flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def flash_notice
    @flash_options =
      if @result.success
        { notice: t(
          '.success',
          gist_url: ActionController::Base.helpers.link_to(
            t('.gist_link'),
            @result.response_body['html_url'],
            target: :blank
          )
        ) }
      else
        { alert: t('.failure') }
      end
  end

  def create_gist_in_bd
    Gist.create(
      url: @result.response_body['html_url'],
      question: @test_passage.current_question,
      user: current_user,
      github_id: @result.response_body['id']
    )
  end
end
