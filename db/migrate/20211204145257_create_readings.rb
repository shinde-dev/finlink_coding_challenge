# frozen_string_literal: true

class CreateReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :readings, id: :uuid do |t|
      t.references :thermostat, null: false, foreign_key: true, type: :uuid
      # TODO: : Would number be a DB SEQUENCE?
      t.integer :number
      t.float :temprature
      t.float :humidity
      t.float :battery_charge
      t.timestamps
    end
  end
end
