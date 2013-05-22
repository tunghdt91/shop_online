class AddManufacturerToProducts < ActiveRecord::Migration
  def change
    add_column :products, :manufacturer, :integer
  end
end
