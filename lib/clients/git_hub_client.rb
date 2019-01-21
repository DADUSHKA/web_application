class GitHubClient

  ROOT_ANDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '456cb043b098da534172bd73bbab317a2660c4d5'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ANDPOINT)
  end

end
