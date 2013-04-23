class Auction < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :bids

  validates :name, :presence => true, :uniqueness => true
  #callback
  #before_save :set_ends_at
  after_create :set_ends_at

  def highest_bid
  	bids.order("amount DESC").first
  end

  def to_param
  	"#{id}-#{name.parameterize}"
  end

  def set_ends_at
  	update_attribute :ends_at, created_at + days.to_i.days
  	#self.ends = created_at + days.to_i.days
  end

  def bid_list
    @bid_list =  Auction.find(params[:id]).bids.all
  end

  def current_high_bid
  end
  

#  def days=(number) #overiding the setter
#  	self.ends_at = created_at + number.to_i.days
#    self[:days] = number
#  end

 # def ends_at
 # 	created_at + 7.days
 # end

#  def ended?
#  	 Time.now > ends_at
#  end
end
