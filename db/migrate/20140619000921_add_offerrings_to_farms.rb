class AddOfferringsToFarms < ActiveRecord::Migration
  def change
  	add_column :farms, :offer_spring, :string
  	add_column :farms, :offer_summer, :string
  	add_column :farms, :offer_fall, :string
  	add_column :farms, :offer_winter, :string
  end
end
