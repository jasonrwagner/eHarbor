class Bid < ActiveRecord::Base
  attr_accessible :amount, :auction_id

  belongs_to :auction

  validates :amount, :presence => true,
  					 :numericality => {:greater_than => 0}

  validate :ensure_highest_bid

  def ensure_highest_bid
    if  auction.highest_bid && auction.highest_bid.amount >= amount
      errors.add(:amount, "must be higher than that")
    end
  end


end
# homework make keep bids going up so if amoutn is 10 someone cant bid 7
#make a validation that checks the bid is always getting higher
#hint validate :some_method_to_call is a custom validate