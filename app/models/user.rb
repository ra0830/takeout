class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_shops, through: :favorites, source: :shop
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
