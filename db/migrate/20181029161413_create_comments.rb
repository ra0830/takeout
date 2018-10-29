class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content
      t.bigint :shop_id
      t.bigint :user_id
      t.string :shop_id
      t.string :user_id

      t.timestamps
    end
    add_index :comments, :shop_id
    add_index :comments, :user_id
  end
end
