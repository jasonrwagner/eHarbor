require 'spec_helper'

describe AuctionsController do
  it "index lists auctions" do
  	get :index
  	response.should be_success
  	response.should render_template('index')
  end

  describe "create" do
  	it "saves the auction on success" do
  	end

  	it "shows the form on error" do
  	end
  end
end