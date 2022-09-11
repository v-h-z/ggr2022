class AddYbdataToBoats < ActiveRecord::Migration[7.0]
  def change
    add_column :boats, :yb_serial, :string
    add_column :boats, :yb_marker, :string
  end
end
