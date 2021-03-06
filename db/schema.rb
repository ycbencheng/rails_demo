# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_08_204746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "marketplaces", force: :cascade do |t|
    t.bigint "transaction_id"
    t.float "revenue", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transaction_id"], name: "index_marketplaces_on_transaction_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.bigint "widget_id"
    t.float "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["buyer_id"], name: "index_transactions_on_buyer_id"
    t.index ["seller_id"], name: "index_transactions_on_seller_id"
    t.index ["widget_id"], name: "index_transactions_on_widget_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "deposit_amount", default: 0.0
  end

  create_table "widgets", force: :cascade do |t|
    t.bigint "seller_id"
    t.text "description"
    t.float "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["seller_id"], name: "index_widgets_on_seller_id"
  end

  add_foreign_key "transactions", "users", column: "buyer_id"
  add_foreign_key "transactions", "users", column: "seller_id"
  add_foreign_key "widgets", "users", column: "seller_id"
end
