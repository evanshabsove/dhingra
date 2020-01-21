class Order < ApplicationRecord
  belongs_to :order_status
  has_many :order_items
  before_create :set_order_status

  private
  def set_order_status
    self.order_status_id = 1
  end
end
