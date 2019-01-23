class GistQuestionService
  def initialize(question, token, client = nil)
    @token = token
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: @token.to_s)
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: "A question about #{@test.title} from TestGuru!",

      files: {
        'test_guru_question_test' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.description]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
