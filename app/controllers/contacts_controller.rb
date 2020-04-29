class ContactsController < ApplicationController

  def new
  end

  def create
    ContactMailer
      .with(user_email: current_user.email, email_body: params[:contact_field])
      .contact_email
      .deliver_now
    redirect_to root_path
  end
end
