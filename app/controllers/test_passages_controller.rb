class TestPassagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_test_passage, only: %i[show update result]

  def show; end

  def result; end

  def update
    result = TestPassages::UpdateOperation.new(params).call

    if result.success
      redirect_to result_test_passage_path(@test_passage)
    else
      @test_passage.reload
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

end
