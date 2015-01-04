class ContactsController < ApplicationController

#  the 7 'rails way' methods that we get from ApplicatonController, and should use by convention
# index – display a list of all items
# show – display a record of one item
# new – display an empty form
# create – save a record of a new item
# edit – display a record for editing
# update – save an edited record
# destroy – delete a record



# We won’t piggyback on behavior from the ApplicationController create method. 
# But we’ll implement a create method because, by convention, the form will submit 
# the data to the controller’s create method. SimpleForm will create a destination 
# URL that corresponds to the ContactsController#create action.

# Rails routing is aware of the seven standard controller actions.
# In fact, it takes only one keyword (with one parameter) to generate seven different 
# routes for any controller. The keyword is resources and supplying a name that matches 
# a model and controller provides all seven routes. 
# like this:   resources :contacts, only: [:new, :create]


  def new
    @contact = Contact.new
    @contact.name = "Dudette Namingo"
    @contact.email = 'dudnam@coolguy.com'
    @contact.content = 'do it now!!'
  end

  def create
    @contact = Contact.new(secure_params)   # lame!! not real 2 way databinding afer all!!
    if @contact.valid?
      # TODO save data
      # TODO send message
      flash[:notice] = "Message sent from #{@contact.name}"
      redirect_to root_path
    else
      render :new
    end
  end

private

  def secure_params
    params.require(:contact).permit(:name, :email, :content)
  end
end  #end class
