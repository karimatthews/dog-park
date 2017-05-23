class AddParamsToPark < ActiveRecord::Migration[5.1]
  def change
    add_column :parks, :offlead, :integer
    add_column :parks, :fence, :integer
    add_column :parks, :bag, :integer
  end
end
