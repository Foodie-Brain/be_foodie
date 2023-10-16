class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :photo
      t.string :description
      t.integer :dairy_free, default: 0
      t.integer :gluten_free, default: 0
      t.integer :halal, default: 0
      t.integer :kosher, default: 0
      t.integer :nut_free, default: 0
      t.integer :vegan, default: 0
      t.integer :vegetarian, default: 0
      t.integer :likes, default: 0
      t.integer :dislikes, default: 0
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
