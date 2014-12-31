class Owner
	def name
		namev = 'Oldman Foobar'
	end

	def funnyName
		name
	end

	def birthdate
		birthdatev = Date.new(1900,12,22)
	end

	def countdown

# note: below we are accessing the birthdate instance method, without any object reference to ourselves

		today = Date.today
		birthday = Date.new(today.year, birthdate.month, birthdate.day)
		if birthday > today
			countdown = (birthday - today).to_i
		else
			countdown = (birthday.next_year - today).to_i
		end
	end
end