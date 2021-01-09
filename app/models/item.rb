class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :explanation
    validates :category_id
    validates :state_id
    validates :shipping_fee_id
    validates :shipping_place_id
    validates :day_id
    validates :price
    validates :user
    validates :image
  end
  
  belongs_to :user
end
