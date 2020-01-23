class PostcodesController < ApplicationController

	def show
	end

	def check
		# get postcode from textbox
		postcode = params["postcode"]
		postcodes_io = ::Postcodes.new
		if postcode.present? && postcodes_io.is_postcode_valid?(postcode)
			Rails.logger.info("INFO: received a valid postcode")
			details = postcodes_io.get_postcode_details(postcode)

			if details[:lsoa].downcase.start_with?(*::Postcodes::WANTED_LSOA)
				@result = "The postcode is IN one of the desired lsoa areas"
				Rails.logger.info("INFO: valid postcode is in one of the lsoa areas")
			else
				@result = "The postcode is OUTSIDE the desired lsoa areas"
				Rails.logger.info("INFO: valid postcode is outside the lsoa areas")
			end
		else
			@result = "The postcode is OUTSIDE the desired lsoa areas"
			Rails.logger.info("INFO: received an invalid postcode")
		end
	end
end
