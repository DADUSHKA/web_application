class GistQuestionService
  def initialize(question, client = nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('descript', title: "#{@test.title}"),

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
