class CreateProductGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :product_groups do |t|
      t.string :title
      t.integer :province_group_id
      t.string :image
      t.timestamps
    end
  end
end
