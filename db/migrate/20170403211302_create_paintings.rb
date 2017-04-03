class CreatePaintings < ActiveRecord::Migration[5.0]
  def change
    create_table :paintings do |t|
      t.string :title
      t.text :description
      t.string :image
      t.integer :gallary_id
      t.timestamps
    end
  end
end
