class AddDepositAmountToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :deposit_amount, :float, default: 0.0
  end
end
