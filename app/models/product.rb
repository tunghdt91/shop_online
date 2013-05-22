class Product < ActiveRecord::Base
  	attr_accessible :category_id, :description, :detail, :name, :price, :manufacturer_id
	belongs_to :category
	has_many :product_microposts, dependent: :destroy
	belongs_to :manufacturer
	has_many :orders, class_name: "Order", foreign_key: :product_id

	validates :name, presence: true
  	validates :category_id, presence: true
   	validates :price, presence: true
end
