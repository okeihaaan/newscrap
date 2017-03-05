class EditCategories < ActiveRecord::Migration[5.0]
  def change
    change_column :categories, :category, :name
  end
end
