class AddAboutToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :about, :string
  end
end
