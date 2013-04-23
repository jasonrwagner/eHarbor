require 'test_helper'

class AuctionTest < ActiveSupport::TestCase

  test "to_param" do
  	auction = Auction.create(:name => 'Table')
  	assert_equal "#{auction.id}-table", auction.to_param
  	assert auction.to_param.include?('-table')
  	assert_match /\d+-\w+/, auction.to_param
  end
end
