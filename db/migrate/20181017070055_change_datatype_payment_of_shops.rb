class ChangeDatatypePaymentOfShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :payment, :'integer USING CAST(payment AS integer)' 
  end
end
