class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :titulo
      t.text :descripcion
      t.integer :precio

      t.timestamps
    end
  end
end
