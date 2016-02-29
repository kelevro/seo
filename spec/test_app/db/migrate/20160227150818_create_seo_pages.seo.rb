# This migration comes from seo (originally 20160211172548)
class CreateSeoPages < ActiveRecord::Migration
  def change
    create_table :seo_pages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
