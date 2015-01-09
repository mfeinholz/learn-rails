class Visitor
    include ActiveModel::Model
    # mix in Model... This is the best way to create a model that does not use a database. 
    # In other applications, where models use a database, you will create a model class that 
    # inherits from ActiveRecord instead.

    attr_accessor :email, :string

    validates_presence_of :email
    validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

    def subscribe
      mailchimp = Gibbon::API.new(Rails.application.secrets.mailchimp_api_key)
      result = mailchimp.lists.subscribe({
        id: Rails.application.secrets.mailchimp_list_id, 
        email: {email: self.email},
        double_optin: false, 
        update_existing: true, 
        send_welcome: true
        })
      # confused about accessing class methods. why does the following code say self.email, 
      # earlier, i saw code that simply said email, and it found the instance method, without
      # having to say 'self'... also, why did I see an instance method on a controller called 
      # using the name of the class, instead of an instance variable like this: 
      # UserMailer.contact_email(@contact).deliver
      Rails.logger.info("subscribed #{self.email} to MailChimp") if result
    end #subscribe

end #class