class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :shipping_place
  belongs_to :day

  has_one_attached :image

  belongs_to :user

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

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :shipping_fee_id
    validates :shipping_place_id
    validates :day_id
  end
end
