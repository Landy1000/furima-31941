class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_fee
  belongs_to :shipping_place
  belongs_to :day

  has_one_attached :image

  belongs_to :user
  has_one :order

  with_options presence: true do
    validates :name
    validates :explanation
    validates :user
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :state_id
    validates :shipping_fee_id
    validates :shipping_place_id
    validates :day_id
  end

  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                    message: 'Out of setting range'
  validates_numericality_of :price, only_integer: true, message: 'Half-width number'
end
