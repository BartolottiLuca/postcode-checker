require 'test_helper'

class PostcodesTest < ActiveSupport::TestCase
	postcodes = ::Postcodes.new

	test "valid postcode" do
		assert_equal true, postcodes.is_postcode_valid?("SE17QL")
	end

	test 'invalid postcode' do
		assert_equal false, postcodes.is_postcode_valid?("banana")
	end

	test 'postcode in Lambeth' do
		details = postcodes.get_postcode_details("SE116SP")
		assert_equal true, details[:lsoa]&.downcase&.starts_with?("lambeth")
	end

	test 'postcode in Southwark' do
		details = postcodes.get_postcode_details("SE17QL")
		assert_equal true, details[:lsoa]&.downcase&.starts_with?("southwark")
	end

	test 'details of invalid postcode' do
		assert_raises { postcodes.get_postcode_details("banana") }
	end
end