class CreateJoinTableDogPark < ActiveRecord::Migration[5.1]
  def change
    create_join_table :dogs, :parks do |t|
      t.index [:dog_id, :park_id]
      # t.index [:park_id, :dog_id]
    end
  end
end
