class Review < ApplicationRecord

  validates_presence_of :name, 
                        :description, 
                        :lat, 
                        :lon
                        #Todo add photo here 

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
