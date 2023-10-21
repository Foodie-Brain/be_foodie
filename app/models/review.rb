class Review < ApplicationRecord
  has_one_attached :photo

  validates_presence_of :name, 
                        :description, 
                        :lat, 
                        :lng
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

  def photo_url
    Rails.application.routes.url_helpers.rails_blob_url(self.photo, only_path: true) if self.photo.attached?
  end
end
