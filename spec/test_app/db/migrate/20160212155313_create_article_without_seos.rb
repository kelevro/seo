class CreateArticleWithoutSeos < ActiveRecord::Migration
  def change
    create_table :article_without_seos do |t|

      t.timestamps null: false
    end
  end
end
