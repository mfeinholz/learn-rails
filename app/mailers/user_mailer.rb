class UserMailer < ActionMailer::Base
  # default is a hash variable
  #     1. it turns out that default is a public class method on ActionMailer. 
  #     2. i think i read that class definitions are acutally 'executed'... so when this class definition is come across 
  #        by the interpreter and the definition is 'executed' the ActionMailer.default method is called. 
  #   
  #     3. in the rails console, UserMailer.default gives me what I expect... but UserMailer.new fails (new is private)
  #     3. but the method i created below contact_email is also invoked on the class, not an instance (UserMailer.contact_email() 
  #         this works because ActionMailer implements a missing_method method and uses some reflection magic to pull this all off.  
  default from: "do-not-reply@markfeinholz.com"

  def contact_email(contact)

    # this method is the name of the view, that glues it all up, and allows mailer to render the view/content of the email
    ## ... views/user_mailer/contact_email.html.erb and contact_email.html.erb.text
    #  ... the views require the @contact istance variable
    
    @contact = contact
    mail(to: Rails.application.secrets.owner_email, from: @contact.email, subject: "Website Contact")
  
  end #contact_email

  

end #class
