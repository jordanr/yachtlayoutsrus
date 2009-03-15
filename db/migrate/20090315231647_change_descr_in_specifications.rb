class ChangeDescrInSpecifications < ActiveRecord::Migration
  def self.up
    remove_column :specifications, :description
    add_column :specifications, :description, :text
  end

  def self.down
    remove_column :specifications, :description
    add_column :specifications, :description, :string
  end
end
