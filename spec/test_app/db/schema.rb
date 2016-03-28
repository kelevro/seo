# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160301191437) do

  create_table "article_without_seos", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seo_models", force: :cascade do |t|
    t.string   "model",      null: false
    t.string   "controller", null: false
    t.string   "action",     null: false
    t.string   "param_name"
    t.integer  "page_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "seo_models", ["controller", "action"], name: "index_seo_models_on_controller_and_action"
  add_index "seo_models", ["page_id"], name: "index_seo_models_on_page_id"

  create_table "seo_pages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "seo_record_translations", force: :cascade do |t|
    t.integer  "seo_record_id", null: false
    t.string   "locale",        null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "title"
    t.text     "description"
    t.string   "keywords"
    t.text     "seo_text"
  end

  add_index "seo_record_translations", ["locale"], name: "index_seo_record_translations_on_locale"
  add_index "seo_record_translations", ["seo_record_id"], name: "index_seo_record_translations_on_seo_record_id"

  create_table "seo_records", force: :cascade do |t|
    t.integer  "seoable_id",   null: false
    t.string   "seoable_type", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "action"
  end

  add_index "seo_records", ["action"], name: "index_seo_records_on_action"
  add_index "seo_records", ["seoable_id", "seoable_type"], name: "index_seo_records_on_seoable_id_and_seoable_type"

end
