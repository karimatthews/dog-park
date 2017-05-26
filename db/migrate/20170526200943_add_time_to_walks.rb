class AddTimeToWalks < ActiveRecord::Migration[5.1]
  def change
    add_column :walks, :time, :string
  end
end
