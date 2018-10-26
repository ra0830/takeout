class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :shop_id
      t.string :score

      t.timestamps
    end
  end
end
