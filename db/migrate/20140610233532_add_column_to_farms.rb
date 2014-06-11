class AddColumnToFarms < ActiveRecord::Migration
  def change
  	add_column :farms, :user_id, :integer
  end
end
