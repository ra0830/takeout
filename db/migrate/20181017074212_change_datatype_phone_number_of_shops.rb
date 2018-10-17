class ChangeDatatypePhoneNumberOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :phone_number, :'integer USING CAST(phone_number AS integer)'
  end
end
