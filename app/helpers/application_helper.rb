module ApplicationHelper

  def output_current_year
    Time.zone.now.year
  end

  def github_url(title, repo)
    link_to title, repo
  end

end
