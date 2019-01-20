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

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end
end
