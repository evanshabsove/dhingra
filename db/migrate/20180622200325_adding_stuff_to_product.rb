class AddingStuffToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :price, :float
    add_column :products, :code, :string
    add_column :products, :product_group_id, :integer
    add_column :products, :min, :string
    remove_column :products, :image
  end
end
