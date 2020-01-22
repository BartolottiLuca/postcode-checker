class PostcodesController < ApplicationController
	include PostcodesIo

	WANTED_LSOA = [
		"lamberth",
		"waterloo",
	]

	def show
		render form
	end

	def check
		# get postcode from textbox
		postcode = "SE17QL"
		if is_postcode_valid?(postcode)
			details = get_postcode_details(postcode)

			if details[:lsoa].downcase.start_with?(*WANTED_LSOA)
				render success # whatever
			else
				render failure # whatever
			end
		else
			render invalid #whatever dude
		end
	end
end
