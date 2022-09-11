class CreatePositions < ActiveRecord::Migration[7.0]
  def change
    create_table :positions do |t|
      t.string :gps_at
      t.string :latitude
      t.string :longitude
      t.string :altitude
      t.string :sog
      t.string :cog
      t.string :battery
      t.string :yb_id
      t.string :temperature
      t.string :tx_at
      t.references :boat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
