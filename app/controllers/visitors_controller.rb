class VisitorsController < ApplicationController

	def new
		@owner = Owner.new

		# mfnote: ruby magic in the inherited ApplicatonController is taking care of doing this: 
		#render 'visitors/new'
		# we could do it ourselves right here if we wanted. but the naming convention ensures it will happen for us
	end

end