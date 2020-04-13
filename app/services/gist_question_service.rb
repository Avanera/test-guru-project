# frozen_string_literal: true

class GistQuestionService
  def initialize(question, current_user, client: nil)
    @question = question
    @cuser = current_user
    @test = @question.test
    @client = client || GitHubClient.new
    @result = OpenStruct.new(success: true, response_body: nil)
  end

  def call
    begin
      @result.response_body = @client.create_gist(gist_params)
    rescue StandardError => e
      @result.success = false
      Rails.logger.error(
        "An error occured while calling #{self.class}. The original error was: #{e}"
      )
    end

    create_gist_in_db if @result.success

    @result
  end

  private

  def gist_params
    {
      description: I18n.t('test_passages.gist.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

  def create_gist_in_db
    Gist.create(
      url: @result.response_body['html_url'],
      question: @question,
      user: @cuser
    )
  end
end
