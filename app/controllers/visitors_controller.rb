class VisitorsController < ApplicationController

	def new

	  Rails.logger.debug 'DEBUG: entering new method'
      @owner = Owner.new
      Rails.logger.debug 'DEBUG: Owner name is ' + @owner.name

      # raise "forced crash to see a stack trace and how the better_errors gem we have installed handles errors in the browser"
	
		# mfnote: ruby magic in the inherited ApplicatonController is taking care of doing this: 
		#render 'visitors/new'
		# we just need to make sure the model @owner variable is instanciated with an Owner model object (so it seems that there isn't convention that dictates wiring up of models?)
		# we could call render ourselves right here if we wanted. but the naming convention ensures it will happen for us
		# the naming convention seems to go like this: 
		#   the route defines that we go to "visitors#new"  this means: 
		#    1. a visitors controller, which by definition is a class called VisitorsController
		#    2. with a "new" method
		#    3. it is expected that there will be a visitors dir under the view dir
		#    4. and in this dir there will be a new view... which is in a file called new.html.erb  - where erb is the html templating engine/gem that we are using. 
		#  note that this view is not a ruby class, it is a templated html file. 

		#  so, there is a ton of convention going on... again
		#  the route takes us to the controller and if not defined in the controller, render is called on a view expected in a directory by the same name as the controller with a view file with the same name as the method we called on the controller.... yikes!!!

		# A Rails view is NOT a separate class. It is a template and, under the hood, it is part of the current controller object, this is why instance variables in the controller are available in the view template code
		

	end

end