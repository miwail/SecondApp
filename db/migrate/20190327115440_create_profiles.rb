# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :second_name
      t.string :sex
      t.string :country
      t.date :birthday
      t.text :about
      t.integer :user_id

      t.timestamps
    end
  end
end
