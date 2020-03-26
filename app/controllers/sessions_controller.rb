class SessionsController < ApplicationController

  def new
    redirect_to tests_path if logged_in?
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      deny_access
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
