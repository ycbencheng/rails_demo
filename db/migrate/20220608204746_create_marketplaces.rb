class CreateMarketplaces < ActiveRecord::Migration[6.1]
  def change
    create_table :marketplaces do |t|
      t.references :transaction
      t.float :revenue, default: 0.0

      t.timestamps
    end
  end
end
