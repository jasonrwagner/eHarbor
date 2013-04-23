class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :auction_id
      t.decimal :amount, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
