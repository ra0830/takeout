class Shop < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :rates, dependent: :destroy
  has_many :rate_users, through: :rates, source: :user
  validates :name, presence: true, length: { maximum: 50 }
  mount_uploader :image, ImageUploader

  def self.search(search, pages)
    if search
      Shop.where(['station LIKE ?', "%#{search}%"]).page(pages)
    else
      Shop.all.page(pages)
    end
  end

  def self.search_category(search_category, shop_category, pages)
    if search_category == 'true'
      Shop.where(category: shop_category).page(pages)
    else
      Shop.all.page(pages)
    end
  end

end
