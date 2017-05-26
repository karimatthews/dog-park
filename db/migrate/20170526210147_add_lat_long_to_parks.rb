class AddLatLongToParks < ActiveRecord::Migration[5.1]
  def change
    add_column :parks, :latitude, :string
    add_column :parks, :longitude, :string
  end
end
