class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || client = Octokit::Client.new(:access_token => ENV.fetch('GITHUB_ACCESS_TOKEN'))
  end

  def call
    @client.create_gist(gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  def gist_url
    @client.last_response.data[:html_url]
  end

  private

  def gist_params
    {
      "description": " #{@test.title} from TestGuru Example ",
      public: true,
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