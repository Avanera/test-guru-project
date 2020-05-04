class BadgesController < ApplicationController

  def index
    @badges = Badge.all
  end

  def user_badges
    @user_badges = current_user.badges
    if @user_badges.any?
      render 'user_badges'
    else
      redirect_to root_path, alert: 'You have no badges yet'
    end
  end
end
