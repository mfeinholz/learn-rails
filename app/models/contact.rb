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

end