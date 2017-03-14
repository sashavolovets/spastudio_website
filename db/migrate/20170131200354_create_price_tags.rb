class CreatePriceTags < ActiveRecord::Migration[5.0]
  def change
    create_table :price_tags do |t|
      t.string :service_id
      t.string :tag
      t.integer :price

      t.timestamps
    end
  end
end
