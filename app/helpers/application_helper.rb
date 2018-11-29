module ApplicationHelper

  def output_current_year
    Time.current.year
  end

  def github_url(title, login, repo)
    link_to title, "https://github.com/" + login + "/" + repo, target: :_blank
  end

  def thinknetica_url
    link_to "Thinknetica", "http://www.thinknetica.com/", target: :_blank
  end

end
