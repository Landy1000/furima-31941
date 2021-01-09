class Item < ApplicationRecord
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
  end

  belongs_to :user
end
