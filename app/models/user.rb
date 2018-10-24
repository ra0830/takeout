class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :shops, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
