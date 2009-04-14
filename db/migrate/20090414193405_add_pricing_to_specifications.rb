class AddPricingToSpecifications < ActiveRecord::Migration
  def self.up
    add_column :specifications, :price, :integer
    add_column :specifications, :time_to_sell, :integer
  end

  def self.down
    remove_column :specifications, :time_to_sell
    remove_column :specifications, :price
  end
end
