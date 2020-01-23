class PostcodesController < ApplicationController

	def show
	end

	def check
		# get postcode from textbox
		postcode = params["postcode"]

		@result = Postcodes.check_postcode(postcode) if postcode.present?
	end
end
