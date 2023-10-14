class Review < ApplicationRecord

  validates_presence_of :name, 
                        :photo, 
                        :description, 
                        :lat, 
                        :lon

  validates_numericality_of :dairy_free, 
                            :gluten_free, 
                            :halal, 
                            :kosher, 
                            :nut_free, 
                            :vegan, 
                            :vegetarian, 
                            :likes, 
                            :dislikes
end
