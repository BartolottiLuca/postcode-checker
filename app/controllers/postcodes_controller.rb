class PostcodesController < ApplicationController
	include PostcodesIo

	def show
		render form
	end

	def check
		# get postcode from textbox
		postcode = "SE17QL"
		postcodes_io = Postcodes.new
		if postcodes_io.is_postcode_valid?(postcode)
			details = postcodes_io.get_postcode_details(postcode)

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
