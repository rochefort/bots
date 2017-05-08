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

ActiveRecord::Schema.define(version: 20170508045540) do

  create_table "account_rss_items", force: :cascade do |t|
    t.integer  "account_id",   null: false
    t.integer  "rss_item_id",  null: false
    t.datetime "tweeted_date"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["account_id", "rss_item_id"], name: "index_account_rss_items_on_account_id_and_rss_item_id", unique: true
    t.index ["account_id"], name: "index_account_rss_items_on_account_id"
    t.index ["rss_item_id"], name: "index_account_rss_items_on_rss_item_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string   "name"
    t.string   "note"
    t.string   "associate_tag"
    t.integer  "status",                           default: 0
    t.string   "keywords"
    t.string   "encrypted_consumer_key"
    t.string   "encrypted_consumer_key_iv"
    t.string   "encrypted_consumer_secret"
    t.string   "encrypted_consumer_secret_iv"
    t.string   "encrypted_access_token"
    t.string   "encrypted_access_token_iv"
    t.string   "encrypted_access_token_secret"
    t.string   "encrypted_access_token_secret_iv"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.string   "name_alias"
    t.string   "position"
    t.integer  "number"
    t.string   "birth_date"
    t.string   "height"
    t.string   "weight"
    t.string   "hometown"
    t.string   "former_team"
    t.string   "twitter_account"
    t.string   "instagram_account"
    t.string   "blog_url"
    t.string   "blog_rss_url"
    t.string   "chant"
    t.integer  "status",            default: 0
    t.integer  "account_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["account_id"], name: "index_players_on_account_id"
  end

  create_table "product_reviews", force: :cascade do |t|
    t.string   "reviewer",    null: false
    t.string   "reviewer_id", null: false
    t.string   "title",       null: false
    t.string   "description", null: false
    t.date     "review_date", null: false
    t.float    "score",       null: false
    t.integer  "product_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["product_id"], name: "index_product_reviews_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string   "asin",                             null: false
    t.string   "title",                            null: false
    t.string   "authors"
    t.string   "binding"
    t.string   "format"
    t.string   "ean"
    t.string   "isbn"
    t.string   "label"
    t.string   "number_of_pages"
    t.string   "product_group"
    t.string   "publication_date"
    t.string   "manufacturer"
    t.string   "publisher"
    t.string   "studio"
    t.boolean  "is_adult_product", default: false
    t.boolean  "is_kindle",        default: false
    t.integer  "price"
    t.string   "currency"
    t.float    "score"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.index ["asin"], name: "index_products_on_asin", unique: true
  end

  create_table "rss_items", force: :cascade do |t|
    t.string   "title"
    t.datetime "pub_date"
    t.string   "description"
    t.string   "link"
    t.string   "guid"
    t.integer  "status",      default: 0
    t.integer  "rss_site_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["link"], name: "index_rss_items_on_link", unique: true
    t.index ["rss_site_id"], name: "index_rss_items_on_rss_site_id"
  end

  create_table "rss_sites", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_rss_sites_on_title", unique: true
    t.index ["url"], name: "index_rss_sites_on_url", unique: true
  end

end
