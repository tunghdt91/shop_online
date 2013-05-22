class Order < ActiveRecord::Base
  attr_accessible :status, :user_id
  has_many :product_orders, class_name: "ProductOrder", foreign_key: :order_id, dependent: :destroy
  belongs_to :user



   def add_product(product_id)
 
		current_item = ProductOrder.where(:product_id => product_id).first

		current_item.quantity = 1
		if current_item
			current_item.quantity += 1
		else
			current_item = product_orders.build(:product_id => product_id)
		end
			current_item
	end

	def total_price
		product_orders.to_a.sum { |item| item.total_price }
	end

	def total_items
		product_orders.sum(:quantity)
	end

end
