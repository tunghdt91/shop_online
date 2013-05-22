class AddPointToUsers < ActiveRecord::Migration
  def change
    add_column :users, :point, :integer, default: 10
  end
end
