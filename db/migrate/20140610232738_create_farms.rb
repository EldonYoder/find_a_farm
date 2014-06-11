class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
    	t.string 		:name
    	t.text			:description
    	t.string		:address
    	t.float			:latitude
    	t.float			:longitude
    	t.string		:hours_open
    	t.string		:days_open
    	t.string		:months_open
    	t.string		:phone_num
      t.timestamps
    end
  end
end
