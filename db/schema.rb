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

ActiveRecord::Schema.define(version: 2018_12_10_054751) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "card_types", force: :cascade do |t|
    t.string "name", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "card_types_merchant_category_codes", force: :cascade do |t|
    t.integer "card_type_id"
    t.integer "merchant_category_code_id"
    t.index ["card_type_id"], name: "index_cts_mccs_on_ct_id"
    t.index ["merchant_category_code_id"], name: "index_cts_mccs_on_mcc_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "card_type_id"
    t.integer "employee_id"
    t.integer "card_number", limit: 16
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_type_id"], name: "index_cards_on_card_type_id"
    t.index ["employee_id"], name: "index_cards_on_employee_id", unique: true
  end

  create_table "employees", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "employee_id", limit: 20
    t.string "name"
    t.integer "mobile_number", limit: 12
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "merchant_category_codes", force: :cascade do |t|
    t.string "name"
    t.string "code", limit: 3
    t.integer "limit", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "card_id"
    t.integer "merchant_category_code_id"
    t.string "transaction_id", null: false
    t.string "mcc", null: false
    t.string "merchant_name", null: false
    t.decimal "tax_amount", null: false
    t.decimal "amount", null: false
    t.string "status", null: false
    t.datetime "transaction_at", null: false
    t.string "error_message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id"], name: "index_transactions_on_card_id"
    t.index ["employee_id"], name: "index_transactions_on_employee_id"
    t.index ["merchant_category_code_id"], name: "index_transactions_on_merchant_category_code_id"
  end

end
