require 'test_helper'

class PostcodesTest < MiniTest::Unit::TestCase
	include Postcodes

	#test 'valid postcode' do
	#	assert_equal true, is_postcode_valid?("SE1 7QL")
	#end
	#
	#test 'invalid postcode' do
	#	assert_equal false, is_postcode_valid?("banana")
	#end
	#
	#test 'postcode in Lambeth' do
	#	details = get_postcode_details ("SE11 6SP")
	#	assert_equal true, details[:lsoa].downcase.start_with("lambeth")
	#end
	#
	#test 'postcode in Southwark' do
	#	details = get_postcode_details ("SE1 7QL")
	#	assert_equal true, details[:lsoa].downcase.start_with("southwark")
	#end
	#
	#test 'details of invalid postcode' do
	#	assert_raises(get_postcode_details ("banana"))
	#end
end