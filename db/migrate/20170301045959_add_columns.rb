class AddColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :souce, :text
    add_column :articles, :favorite, :boolean, default: false
    add_column :articles, :category_id, :integer, default: 1 
    
    create_table :users do |t|
      t.string :username
      t.string :mail
      t.string :password
    end
  end
end
