class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postcode, null: false
      t.integer :prefecture, null: false
      t.string :city, null: false
      t.string :number, null: false
      t.string :building
      t.string :phone, null: false
      t.integer :purchase_id, null: false
      t.timestamps
    end
  end
end
