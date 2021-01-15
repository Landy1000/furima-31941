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
    validates :price
    validates :user
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1 , message: 'Select'}  do
    validates :category_id
    validates :state_id
    validates :shipping_fee_id
    validates :shipping_place_id
    validates :day_id
  end

  validates :price, format: { with: /\A[0-9]+\z/ , message: 'Half-width number' }
  validates :price, numericality: { greater_than: 300, less_than: 9999999 , message: 'Out of setting range'}
end
