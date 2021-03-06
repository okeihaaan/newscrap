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

ActiveRecord::Schema.define(version: 20170306145404) do

  create_table "article_keywords", force: :cascade do |t|
    t.string "article_id"
    t.string "keyword_id"
  end

  create_table "articles", force: :cascade do |t|
    t.text     "title"
    t.text     "content"
    t.text     "summary1"
    t.text     "summary2"
    t.text     "summary3"
    t.text     "comment"
    t.string   "url"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "souce"
    t.boolean  "favorite",    default: false
    t.integer  "category_id", default: 1
  end

  create_table "categories", force: :cascade do |t|
    t. "name"
  end

  create_table "keywords", force: :cascade do |t|
    t.string "keyword"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "mail"
    t.string "password_digest"
  end

end
