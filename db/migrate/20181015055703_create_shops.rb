class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :shop_name
      t.string :category
      t.string :station
      t.string :phone_number
      t.text :adress
      t.string :payment
      t.text :impression
      t.string :shop_image

      t.timestamps
    end
  end
end
