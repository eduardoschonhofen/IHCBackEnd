class AddReferenceToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :user_type, :string
    add_column :accounts, :user_id, :integer
  end
end
