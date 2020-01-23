class Postcodes
	include HTTParty

	WANTED_LSOA = [
		"lambeth",
		"southwark",
	]

	SPECIAL_POSTCODES = [
		"SH241AB",
		"SH241AA"
	]

	base_uri 'https://api.postcodes.io'

	def self.check_postcode(postcode)
		if SPECIAL_POSTCODES.inlcude?(postcode.gsub(" ", "").upcase)
			Rails.logger.info("INFO:	valid postcode is in one of the lsoa areas")
			return "The postcode is IN one of the desired lsoa areas"
		else
			if self.is_postcode_valid?(postcode)
				Rails.logger.info("INFO:	received a valid postcode")
				details = self.get_postcode_details(postcode)

				if details[:lsoa].downcase.start_with?(*::Postcodes::WANTED_LSOA)
					Rails.logger.info("INFO:	valid postcode is in one of the lsoa areas")
					return "The postcode is IN one of the desired lsoa areas"
				else
					Rails.logger.info("INFO:	valid postcode is outside the lsoa areas")
					return "The postcode is OUTSIDE the desired lsoa areas"
				end
			else
				Rails.logger.info("INFO:	received an invalid postcode")
				return "INVALID postcode specified"
			end
		end
	end

	def self.is_postcode_valid?(postcode)
		# api call to validate
		safe_action = "/postcodes/#{postcode}/validate".gsub(" ", "%20")
		result = self.call_get(safe_action)
		return result
	rescue
		false
	end

	def self.get_postcode_details(postcode)
		# api call to get the postcode
		safe_action = "/postcodes/#{postcode}".gsub(" ", "%20")
		result = self.call_get(safe_action)
		return result.symbolize_keys
	end

	private

	def self.call_get(action)

		resp = get(action)
		raise "Postcodes API error. HTTP Code #{resp.code}. #{resp.parsed_response}" if resp.code > 399

		parsed = resp.parsed_response
		return parsed["result"]
	end

end
