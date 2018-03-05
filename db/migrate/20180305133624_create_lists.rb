class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :nombre
      t.string :titulo
      t.string :detalle
      t.string :url

      t.timestamps
    end
  end
end
