class Shop < ApplicationRecord
  validates :shop_name, presence: true
  mount_uploader :shop_image, ImageUploader
end
