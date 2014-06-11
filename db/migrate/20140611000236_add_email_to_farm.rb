class AddEmailToFarm < ActiveRecord::Migration
  def change
  	add_column :farms, :email_address, :string
  end
end
