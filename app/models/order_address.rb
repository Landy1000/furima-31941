class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :municipality, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
    validates :token
  end

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :prefecture_id
  end

  with_options presence: true do
    validates :post_number
    validates :phone_number
  end
  validates_format_of :post_number, with: /\A\d{3}[-]\d{4}\z/, message: "Input correctly"
  validates_format_of :phone_number, with: /\A[0-9]{11}\z/, message: "Input only number"

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_number: post_number, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end
