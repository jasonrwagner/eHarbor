class AuctionsController < ApplicationController

  def index
  	@auctions = Auction.all
  end

  def new
  	@auctions = Auction.new

    respond_to do |format|
      format.html
      format.json { render json: @auctions }
    end 
  end

   def create
    @auctions = Auction.new(params[:auction])

    respond_to do |format|
     if @auctions.save
        format.html { redirect_to @auctions, notice: 'Auction was successfully created.' }
        format.json { render json: @auctions, status: :created, location: @auctions }
      else
        format.html { render action: "new" }
      end

    end
  end

  def show
  	@auctions = Auction.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @auctions }
    end
  end
end
