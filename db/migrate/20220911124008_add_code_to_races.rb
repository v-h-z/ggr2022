class AddCodeToRaces < ActiveRecord::Migration[7.0]
  def change
    add_column :races, :code, :string
  end
end
