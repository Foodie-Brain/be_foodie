require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:photo) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:lat) }
    it { should validate_presence_of(:lon) }
    it { should validate_numericality_of(:dairy_free) }
    it { should validate_numericality_of(:gluten_free) }
    it { should validate_numericality_of(:halal) }
    it { should validate_numericality_of(:kosher) }
    it { should validate_numericality_of(:nut_free) }
    it { should validate_numericality_of(:vegan) }
    it { should validate_numericality_of(:vegetarian) }
    it { should validate_numericality_of(:likes) }
    it { should validate_numericality_of(:dislikes) }
  end
end