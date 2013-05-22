class Manufacturer < ActiveRecord::Base
  attr_accessible :name
  belongs_to :category
  validates :name, presence: true
  has_many :products, class_name: "Product", foreign_key: :manufacturer_id
end
