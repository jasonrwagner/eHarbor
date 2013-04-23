class AddEndAtToAuctions < ActiveRecord::Migration
  def change
  	add_column :auctions, :ends_at, :datetime
  	add_column :auctions, :days, :integer
  	add_index :auctions, :ends_at  #look at more
  end
end
