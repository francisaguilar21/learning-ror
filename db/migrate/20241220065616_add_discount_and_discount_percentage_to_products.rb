class AddDiscountAndDiscountPercentageToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :discount, :decimal
    add_column :products, :discount_percentage, :decimal
  end
end
