class AddScaleToProductPrices < ActiveRecord::Migration[8.0]
  def change
    change_column :products, :price, :decimal, precision: 10, scale: 2
    change_column :products, :special_price, :decimal, precision: 10, scale: 2
  end
end
