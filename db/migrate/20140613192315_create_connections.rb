class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
    	t.integer		:user_id
    	t.integer		:farm_id
      t.timestamps
    end
  end
end
