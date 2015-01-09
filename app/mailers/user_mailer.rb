class UserMailer < ActionMailer::Base
  default from: "do-not-reply@markfeinholz.com"

  def contact_email(contact)

    # this method is the name of the view... views/user_mailer/contact_email.html.erb and contact_email.html.erb.text
    
    @contact = contact
    mail(to: Rails.application.secrets.owner_email, from: @contact.email, subject: "Website Contact")
  
  end #contact_email

end #class
