class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price, numericality: {greater_than_or_equal_to:300, less_than_or_equal_to:9999999}
    validates :text
    validates :image
    with_options numericality: {other_than:1} do
      validates :category_id
      validates :state_id
      validates :prefecture_id
      validates :ship_day_id
      validates :ship_fee_id
    end
  end

  belongs_to :user
  has_one :purchase
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :Prefecture
  belongs_to :ship_day
  belongs_to :ship_fee
  belongs_to :state
  
end
