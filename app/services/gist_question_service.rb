# frozen_string_literal: true

class GistQuestionService
  def initialize(question, client: nil)
    @question = question
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
end
