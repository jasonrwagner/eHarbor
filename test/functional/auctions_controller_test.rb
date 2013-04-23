require 'test_helper'

class AuctionsControllerTest < ActionController::TestCase
  
  test "index" do
  	get :index
  	assert_response :success
  	assert_template 'index'
  end

  test "show" do
  	auction = Auction.create(:name => 'Chair')
  	get :show, :id => auction.to_param
  	assert_response :success
  	assert_template 'show'
  end

  test "create saves a new auction" do
  	assert_difference "Auction.count", 1 do
  		post :create, :auction => {:name => 'Lampshade'}
  	end

  
  	assert_response :redirect
  	assert Auction.where(:name => 'Lampshade').any?
  	assert_equal 1, Auction.where(:name => 'Lampshade').count

  end

  test "create fails without a name" do
  	assert_no_difference "Auction.count" do
      post :create, :auction => {:description => 'thing'}
    end
  	assert_template 'new'
  	assert_response :success
  	assert_select "form"
  end
end
