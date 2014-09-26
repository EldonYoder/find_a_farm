class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :titles
    	t.string :status, default: "draft"
    	t.text 		:content
    	t.integer :farm_id

      t.timestamps
    end
  end
end
