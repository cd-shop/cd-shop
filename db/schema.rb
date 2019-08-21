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


ActiveRecord::Schema.define(version: 2019_08_18_063639) do
  create_table "addresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "prefecture"
    t.string "municipality"
    t.string "address_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "building"
  end

  create_table "artists", force: :cascade do |t|
    t.string "artistname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cart_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "user_id"
    t.integer "purchase_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cds", force: :cascade do |t|
    t.integer "song_id"
    t.string "product_id"
    t.string "cdname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genrename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "labels", force: :cascade do |t|
    t.string "labelname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_histories", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.string "productname"
    t.string "artistname"
    t.string "labelname"
    t.string "genrename"
    t.text "image_ig"
    t.integer "total_amount"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id"
    t.integer "subtotal"
    t.integer "postage"
    t.integer "shipment_status"
    t.string "address_number"
    t.string "municipality"
    t.string "building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer "genre_id"
    t.integer "artist_id"
    t.integer "label_id"
    t.string "productname"
    t.integer "price"
    t.string "update_date"
    t.integer "stock_number"
    t.integer "sale_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "image_id"
  end

  create_table "songs", force: :cascade do |t|
    t.string "cd_id"
    t.string "songname"
    t.integer "song_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.string "name_kana"
    t.string "tellnumber"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.time "deleted_at"
    t.string "lastname"
    t.string "lastname_kana"
    t.integer "user_status"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
