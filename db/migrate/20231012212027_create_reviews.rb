class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :photo
      t.string :description
      t.integer :dairy_free
      t.integer :gluten_free
      t.integer :halal
      t.integer :kosher
      t.integer :nut_free
      t.integer :vegan
      t.integer :vegitarian
      t.integer :likes
      t.integer :dislikes
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
