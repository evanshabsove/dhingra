class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
