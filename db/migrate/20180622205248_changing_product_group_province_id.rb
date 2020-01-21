class ChangingProductGroupProvinceId < ActiveRecord::Migration[5.0]
  def change
    rename_column :product_groups, :province_group_id, :province_id
  end
end
