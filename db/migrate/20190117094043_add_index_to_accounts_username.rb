class AddIndexToAccountsUsername < ActiveRecord::Migration[5.2]
  def change
    add_index :accounts, :card_number, unique: true
  end
end
