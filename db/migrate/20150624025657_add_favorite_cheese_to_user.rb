class AddFavoriteCheeseToUser < ActiveRecord::Migration
  def change
    add_column :users, :favorite_cheese, :string
  end
end
