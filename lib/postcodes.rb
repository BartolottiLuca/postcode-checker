class Postcodes
	include HTTParty

	WANTED_LSOA = [
		"lambeth",
		"southwark",
	]

	base_uri 'https://api.postcodes.io'

	def is_postcode_valid?(postcode)
		# api call to validate
		safe_action = "/postcodes/#{postcode}/validate".gsub(" ", "%20")
		result = call_get(safe_action)
		return result
	rescue
		false
	end

	def get_postcode_details(postcode)
		# api call to get the postcode
		safe_action = "/postcodes/#{postcode}".gsub(" ", "%20")
		result = call_get(safe_action)
		return result.symbolize_keys
	end


	private

	def call_get(action)

		resp = self.class.get(action)

		raise "Postcodes API error. HTTP Code #{resp.code}. #{resp.parsed_response}" if resp.code > 399

		parsed = resp.parsed_response

		return parsed["result"]
	end

end
