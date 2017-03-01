class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.text :summary1
      t.text :summary2
      t.text :summary3
      t.text :comment
      t.string :url
      t.timestamps null: false
    end
  end
end
