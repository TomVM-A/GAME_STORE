class AddReferencesToGames < ActiveRecord::Migration[7.0]
  def change
    add_reference :games, :category, null: false, foreign_key: true
  end
end
