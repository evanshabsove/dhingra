class ChangeColumnNameInPaintings < ActiveRecord::Migration[5.0]
  def change
    rename_column :paintings, :gallary_id, :gallery_id
  end
end
