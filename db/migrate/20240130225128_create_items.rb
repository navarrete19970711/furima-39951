class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :name,               nill: false
      t.integer    :price,              nill: false
      t.text       :comment,            nill: false
      t.integer    :category_id,        nill: false
      t.integer    :condition_id,       nill: false
      t.integer    :delivery_charge_id, nill: false
      t.integer    :prefecture_id,      nill: false
      t.integer    :shipping_day_id,    nill: false
      t.references :user,               null: false,  foreign_key: true
      t.timestamps
    end
  end
end
