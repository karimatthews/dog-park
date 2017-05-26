class DropDogParkJoinTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :dogs_parks
  end
end
