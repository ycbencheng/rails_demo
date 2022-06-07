class CreateWidgets < ActiveRecord::Migration[6.1]
  def change
    create_table :widgets do |t|
      t.references :seller, foreign_key: { to_table: 'users' }
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
