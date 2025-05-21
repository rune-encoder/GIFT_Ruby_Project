class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.decimal :price, null: false
      t.decimal :special_price
      t.integer :stock, default: 0
      t.boolean :allow_backorder, default: false
      t.boolean :is_on_special, default: false
      t.boolean :is_hidden, default: false
      t.string :image_url
      t.references :category, foreign_key: true

      t.timestamps
    end

    add_index :products, :name, unique: true
  end
end
