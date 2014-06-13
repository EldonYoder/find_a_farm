class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
    	t.integer		:rate_value
    	t.integer		:farm_id
    	t.integer		:user_id
      t.timestamps
    end
  end
end
