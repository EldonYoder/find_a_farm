class ChangeTitlesToTitlePost < ActiveRecord::Migration
  def change
  	remove_column :posts, :titles
  	add_column :posts, :title, :string
  end
end
