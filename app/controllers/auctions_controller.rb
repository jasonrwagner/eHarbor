class AuctionsController < ApplicationController

  def index
  	@auctions = Auction.all
  end

  def new
  	@auction = Auction.new

  end

  def create
    @auction = Auction.new(params[:auction])
    if @auction.save
      redirect_to @auction
    else
      render 'new'
    end

  end

  def show
  	@auction = Auction.find(params[:id])

  end

  def edit
    @auction = Auction.find(params[:id])
  end

  def update
    @auction = Auction.find(params[:id])
    if  @auction.update_attributes(params[:auction])
      redirect_to @auction
    else
      render 'edit'
    end
  end


end
