class CreateUserLists < ActiveRecord::Migration[5.1]
  def change
    create_table :user_lists do |t|
      t.boolean :estatus
      t.references :user, foreign_key: true
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
