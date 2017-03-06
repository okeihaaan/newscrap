class EditPassword < ActiveRecord::Migration[5.0]
  def change
    rename_column :users, :password, :password_digest
    rename_column :categories, :category, :name
  end
end
