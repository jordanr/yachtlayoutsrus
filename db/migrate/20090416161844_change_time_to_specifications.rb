class ChangeTimeToSpecifications < ActiveRecord::Migration
  def self.up
    remove_column :specifications, :time_to_sell
    add_column :specifications, :time_to_sell, :string
  end

  def self.down
    remove_column :specifications, :time_to_sell
    add_column :specifications, :time_to_sell, :integer
  end
end
