module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(title, login, repo)
    link_to title, "https://github.com/#{login}/#{repo}", target: :_blank
  end

  def thinknetica_url
    link_to 'Thinknetica', 'http://www.thinknetica.com/', target: :_blank
  end

  def information_messages
    if flash[:alert]
       content_tag :p, flash[:alert], class: 'flash alert'
    end
  end

end
