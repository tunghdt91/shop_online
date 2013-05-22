class ProductMicropost < ActiveRecord::Base
  attr_accessible :content
  belongs_to :product

  validates :product_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope order: 'product_microposts.created_at DESC'
end
