class AddActionToRecord < ActiveRecord::Migration
  def change
    add_column :seo_records, :action, :string
    add_index :seo_records, :action
  end
end
