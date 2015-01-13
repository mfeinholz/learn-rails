require 'google_drive_v0'

class Contact
  include ActiveModel::Model

  # we describe the fields and state our validation requirements, activeModel does all the rest!

  # the attributes match the fields in the contact form
  attr_accessor :name, :string
  attr_accessor :email, :string
  attr_accessor :content, :string

  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :content
  validates_format_of  :email, 
    :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :content, maximum: 500

  def save
    update_spreadsheet  
  end #save

private 

  def update_spreadsheet

    Rails.logger.debug "Debug gmail user: #{Rails.application.secrets.email_provider_username}"
    Rails.logger.debug "Debug gmail user: #{Rails.application.secrets.email_provider_password}"
    
    connection = GoogleDriveV0.login(Rails.application.secrets.email_provider_username, Rails.application.secrets.email_provider_password)
    Rails.logger.debug "Debug gmail - already dead???"
    ss = connection.spreadsheet_by_title('Learn-Rails-Example')
    if ss.nil?
      ss = connection.create_spreadsheet('Learn-Rails-Example')
    end
    ws = ss.worksheets[0]
    last_row = 1 + ws.num_rows
    ws[last_row, 1] = Time.new
    ws[last_row, 2] = self.name
    ws[last_row, 3] = self.email
    ws[last_row, 4] = self.content
    ws.save

  end #update_spreadsheet

end #class