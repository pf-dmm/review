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

ActiveRecord::Schema.define(version: 2021_03_07_112503) do

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

  create_table "messages", force: :cascade do |t|
    t.integer "user_id"
    t.integer "room_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_messages_on_room_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "pf_reviews", force: :cascade do |t|
    t.integer "reviewer_user_id", null: false
    t.integer "reviewed_user_id", null: false
    t.integer "portfolio_id", null: false
    t.text "good_point", null: false
    t.text "bad_point", null: false
    t.text "learn_from", null: false
    t.text "others"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "review_each_other", default: false, null: false
  end

  create_table "portfolios", force: :cascade do |t|
    t.boolean "signin_ok", default: false, null: false
    t.boolean "signup_ok", default: false, null: false
    t.boolean "instance", default: false, null: false
    t.boolean "share_others", default: false, null: false
    t.string "title", null: false
    t.string "site_url"
    t.string "git_hub_url"
    t.string "files"
    t.text "background_story", null: false
    t.text "target", null: false
    t.text "ingenuity_point", null: false
    t.text "difficult_point", null: false
    t.text "learn_point", null: false
    t.text "wanna_install", null: false
    t.text "remarks"
    t.integer "user_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tag_maps", force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portfolio_id"], name: "index_tag_maps_on_portfolio_id"
    t.index ["tag_id"], name: "index_tag_maps_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", null: false
    t.text "introduction"
    t.text "profile_image_id"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
