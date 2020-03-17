module ApplicationHelper
  def current_year
    Time.zone.now.year
  end

  def github_link
    link_to "Test-Guru Project", 'https://github.com/Avanera/test-guru-project/', target: :_blank
  end
end
