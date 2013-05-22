class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :category_id
      t.string :detail

      t.timestamps
    end
  end
end
