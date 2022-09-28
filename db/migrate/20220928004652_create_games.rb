class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.float :price
      t.string :image
      t.string :category

      t.timestamps
    end
  end
end
