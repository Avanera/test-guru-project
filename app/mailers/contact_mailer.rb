class ContactMailer < ApplicationMailer

  def contact_email
    @user_email = params[:user_email]
    @email_body = params[:email_body]
    mail(to: Admin.pluck(:email), subject: 'From TestGuru Contact Form')
  end
end
