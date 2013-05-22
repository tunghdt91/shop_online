class Category < ActiveRecord::Base
  attr_accessible :name
  validates :name, presence: true

  has_many :products, class_name: "Product", foreign_key: :category_id

end
