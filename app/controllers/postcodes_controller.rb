class PostcodesController < ApplicationController

	def show
		# get postcode from textbox
		postcode = params["postcode"]

		@result = Postcodes.check_postcode(postcode) if postcode.present?
	end

end
