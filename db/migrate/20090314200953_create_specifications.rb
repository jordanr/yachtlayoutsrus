class CreateSpecifications < ActiveRecord::Migration
  def self.up
    create_table :specifications do |t|
      t.string :manufacturer
      t.string :model
      t.integer :year
      t.integer :length

      t.string :lwl
      t.string :loa
      t.string :lod
      t.string :beam
      t.string :min_draft
      t.string :max_draft
      t.string :bridge_clearance
      t.string :displacement
      t.string :ballast
      t.string :cruise_speed
      t.string :max_speed
      t.string :hull_material
      t.string :designer

      t.string :description

      t.string :fuel_tanks
      t.string :water_tanks
      t.string :holding_tanks

      t.string :engine_manufacturer
      t.string :engine_model
      t.string :engine_fuel
      t.string :engine_horsepower
      t.integer :engine_year
      t.integer :number_of_engines

      t.timestamps
    end
  end

  def self.down
    drop_table :specifications
  end
end
