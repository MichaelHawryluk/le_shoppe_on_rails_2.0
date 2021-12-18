class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.int :price
      t.int :product_stock

      t.timestamps
    end
  end
end
