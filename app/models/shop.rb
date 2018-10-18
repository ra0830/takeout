class Shop < ApplicationRecord
  validates :name, presence: true
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
