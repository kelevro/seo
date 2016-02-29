# This migration comes from seo (originally 20160211202224)
class CreateSeoModels < ActiveRecord::Migration
  def change
    create_table :seo_models do |t|
      t.string :model, null: false
      t.string :controller, null: false
      t.string :action, null: false
      t.string :param_name
      t.integer :page_id, index: true

      t.timestamps null: false
    end

    add_index :seo_models, [:controller, :action]
  end
end
