class CreateWalks < ActiveRecord::Migration[5.1]
  def change
    create_table :walks do |t|
      t.integer :dog_id
      t.integer :park_id
    end
  end
end
