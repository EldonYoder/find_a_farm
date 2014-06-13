class AddPolymorphicToRating < ActiveRecord::Migration
  def change
  	add_column :ratings, :rateable_id, :integer
  	add_column :ratings, :rateable_type, :string
  	remove_column :ratings, :farm_id
  end
end
