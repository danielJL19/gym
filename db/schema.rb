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

ActiveRecord::Schema[7.1].define(version: 2024_05_06_141004) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "membership_payments", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "amount"
    t.string "start_pay"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_membership_payments_on_user_id"
  end

  create_table "sale_memberships", force: :cascade do |t|
    t.integer "amount"
    t.string "status"
    t.string "buy_order"
    t.string "session_id"
    t.date "transaction_date"
    t.bigint "user_id", null: false
    t.bigint "membership_payment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["membership_payment_id"], name: "index_sale_memberships_on_membership_payment_id"
    t.index ["user_id"], name: "index_sale_memberships_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rol", default: 0
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "birthdate"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "membership_payments", "users"
  add_foreign_key "sale_memberships", "membership_payments"
  add_foreign_key "sale_memberships", "users"
end
