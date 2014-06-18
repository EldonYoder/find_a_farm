class AddPaymentTypesToFarms < ActiveRecord::Migration
  def change
  	add_column :farms, :payment_types, :string
  end
end
