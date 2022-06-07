class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :seller, foreign_key: { to_table: 'users' }
      t.references :buyer, foreign_key: { to_table: 'users' }
      t.references :widget
      t.float :amount

      t.timestamps
    end
  end
end
