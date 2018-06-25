class ProductGroup < ApplicationRecord

  has_many :products
  belongs_to :province

  mount_uploader :image, ProductUploader

  accepts_nested_attributes_for :products
end
