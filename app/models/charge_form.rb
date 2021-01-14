class ChargeForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block, :building, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :block
    validates :phone_number
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id )
    Address.create(
      postal_code: postal_code, prefecture_id: prefecture_id, city: city, block: block,building: building, phone_number: phone_number,order_id: order.id 
      )
  end

end