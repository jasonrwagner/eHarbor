class BidsController < ApplicationController
  
  def index
  	#@auction = Auction.find(params[:auction_id])
    
  end

  def show
    #@auction = Auction.find(params[:auction_id])    
  	@bid = Bid.find(params[:id])  	
  end

  def new
    #@auction = Auction.find(params[:auction_id])
    @bid = Bid.new	
  end

  def create
    @bid = Bid.new(params[:bid])
    @auction = @bid.auction

      if @bid.save
        redirect_to @auction 
      else
        render 'auctions/show'
      end
  end

end
