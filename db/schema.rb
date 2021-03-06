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

ActiveRecord::Schema.define(version: 20160825162828) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "string_1"
    t.string   "string_2"
    t.string   "string_3"
    t.string   "string_4"
    t.string   "string_5"
    t.string   "string_6"
    t.string   "string_7"
    t.string   "string_8"
    t.string   "string_9"
    t.string   "string_10"
    t.string   "string_11"
    t.string   "string_12"
    t.string   "string_13"
    t.string   "string_14"
    t.string   "string_15"
    t.string   "string_16"
    t.text     "text_1"
    t.text     "text_2"
    t.text     "text_3"
    t.text     "text_4"
    t.text     "text_5"
    t.text     "text_6"
    t.text     "text_7"
    t.text     "text_8"
    t.text     "text_9"
    t.text     "text_10"
    t.string   "page_name"
    t.integer  "integer_1"
    t.integer  "integer_2"
    t.integer  "integer_3"
    t.integer  "integer_4"
    t.string   "image_1"
    t.string   "image_2"
    t.string   "image_3"
    t.string   "image_4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state_provence"
    t.string   "postalcode"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "category_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "image"
    t.index ["category_id"], name: "index_restaurants_on_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "restaurant_id"
    t.index ["restaurant_id"], name: "index_reviews_on_restaurant_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean  "admin",                  default: false
    t.string   "username",               default: "",    null: false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,     null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "country"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
