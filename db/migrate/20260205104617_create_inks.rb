class CreateInks < ActiveRecord::Migration[8.0]
  def change
    create_table :inks do |t|
      t.string :name
      t.string :brand
      t.string :color
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end
