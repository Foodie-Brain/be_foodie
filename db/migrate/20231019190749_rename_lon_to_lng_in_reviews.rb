class RenameLonToLngInReviews < ActiveRecord::Migration[7.0]
  def change
    rename_column :reviews, :lon, :lng
  end
end
