class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|

      t.timestamps
    end
  end
end
