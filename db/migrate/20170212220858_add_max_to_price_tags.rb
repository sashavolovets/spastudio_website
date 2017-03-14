class AddMaxToPriceTags < ActiveRecord::Migration[5.0]
  def change
    rename_column :price_tags, :price, :min_price
    add_column :price_tags, :max_price, :integer
  end
end
