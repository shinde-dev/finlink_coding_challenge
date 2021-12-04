# frozen_string_literal: true

class CreateThermostats < ActiveRecord::Migration[6.1]
  def change
    create_table :thermostats, id: :uuid do |t|
      t.text :household_token, null: false
      t.string :location
      t.timestamps
    end
  end
end
