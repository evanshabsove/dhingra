class Product < ApplicationRecord

  has_many :order_items

  belongs_to :product_group

  default_scope { where(active: true) }
end
