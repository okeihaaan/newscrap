class CreateArticleKeywords < ActiveRecord::Migration[5.0]
  def change
    create_table :article_keywords do |t|
      t.string :article_id
      t.string :keyword_id
    end
  end
end
