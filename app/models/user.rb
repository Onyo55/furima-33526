class User < ApplicationRecord
  with_options presence: true do
    validates :nickname
    validates :email,                 uniqueness: { case_sensitive: false }
    validates :password,              format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
      validates :first_name
      validates :last_name
    end
    with_options format: { with: /\A[ァ-ヶ]+\z/ } do
      validates :first_furigana
      validates :last_furigana
    end
      validates :birthday
  end

  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
