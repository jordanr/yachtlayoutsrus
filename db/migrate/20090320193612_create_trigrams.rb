class CreateTrigrams < ActiveRecord::Migration
  def self.up
    create_table :trigrams do |t|
      t.integer :score
      t.integer :specification_id
      t.string :tg

      t.timestamps
    end
  end

  def self.down
    drop_table :trigrams
  end
end
