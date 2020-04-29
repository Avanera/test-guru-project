# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact_email
    ContactMailer
      .with(user_email: User.first.email, email_body: "Some text")
      .contact_email
  end
end
