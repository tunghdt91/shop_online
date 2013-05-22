class CreateProductMicroposts < ActiveRecord::Migration
  def change
    create_table :product_microposts do |t|
      t.string :content
      t.integer :product_id

      t.timestamps
    end
    add_index :product_microposts, [:product_id, :created_at]	
  end
end
