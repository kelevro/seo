class CreateSeoRecords < ActiveRecord::Migration
  def up
    create_table :seo_records do |t|
      t.integer :seoable_id, null: false
      t.string :seoable_type, null: false

      t.timestamps null: false
    end
    add_index :seo_records, [:seoable_id, :seoable_type]
    Seo::Record.create_translation_table! title:       :string,
                                          description: :text,
                                          keywords:    :string,
                                          seo_text:    :text
  end

  def down
    drop_table :seo_records
    Seo::Record.drop_translation_table!
  end
end
