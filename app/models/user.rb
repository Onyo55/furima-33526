class User < ApplicationRecord
  with_options presence: true do
    validates :nickname
    validates :email,                 uniqueness: { case_sensitive: false }
    validates :password,              format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
    validates :first_name,            format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
    validates :last_name,             format: {with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
    validates :first_furigana,        format: {with: /\A[ァ-ヶ]+\z/}
    validates :last_furigana,         format: {with: /\A[ァ-ヶ]+\z/}
    validates :birthday
 end

  has_many :items
  has_many :purchases

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
