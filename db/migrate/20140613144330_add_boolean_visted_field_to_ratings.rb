class AddBooleanVistedFieldToRatings < ActiveRecord::Migration
  def change
  	add_column :ratings, :has_visited, :boolean
  end
end
