class RemoveCategoryFromGames < ActiveRecord::Migration[7.0]
  def change
    remove_column :games, :category, :string
  end
end
