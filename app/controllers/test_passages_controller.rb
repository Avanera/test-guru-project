class TestPassagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result
    TestsMailer.completed_test(@test_passage).deliver_now
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.success?
      service = BadgesAwardService.new(@test_passage)
      service.call
      if service.awarded?
        flash.notice = "You were given a new badge.
                        #{ActionController::Base.helpers.link_to 'Watch now', user_badges_path}"
      end
    end

    if @test_passage.completed?
      redirect_to result_test_passage_path(@test_passage)
      return
    end

    render :show
  end

  def gist
    current_question = @test_passage.current_question
    service = GistQuestionService.new(current_question)
    response_body = service.call
    if service.success?
      create_gist_in_bd(response_body, current_question, current_user)

      flash_options =
        { notice: t(
          '.success',
          gist_url: ActionController::Base.helpers.link_to(
            t('.gist_link'),
            response_body['html_url'],
            target: :blank
          )
        ) }
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def create_gist_in_bd(response_body, question, user)
    Gist.create(
      url: response_body['html_url'],
      question: question,
      user: user,
      github_id: response_body['id']
    )
  end
end
