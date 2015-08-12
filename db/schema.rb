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

ActiveRecord::Schema.define(version: 20150812163239) do

  create_table "frames", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_file_name",    limit: 255
    t.string   "content_content_type", limit: 255
    t.integer  "content_file_size"
    t.datetime "content_updated_at"
  end

  create_table "photo_sets", force: :cascade do |t|
    t.string   "mdn"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo1_file_name"
    t.string   "photo1_content_type"
    t.integer  "photo1_file_size"
    t.datetime "photo1_updated_at"
    t.string   "photo2_file_name"
    t.string   "photo2_content_type"
    t.integer  "photo2_file_size"
    t.datetime "photo2_updated_at"
    t.string   "photo3_file_name"
    t.string   "photo3_content_type"
    t.integer  "photo3_file_size"
    t.datetime "photo3_updated_at"
    t.string   "photo4_file_name"
    t.string   "photo4_content_type"
    t.integer  "photo4_file_size"
    t.datetime "photo4_updated_at"
    t.text     "photo1_base64"
    t.text     "photo2_base64"
    t.text     "photo3_base64"
    t.text     "photo4_base64"
    t.string   "photo1_filename"
    t.string   "photo2_filename"
    t.string   "photo3_filename"
    t.string   "photo4_filename"
    t.string   "gif_file_name"
    t.string   "gif_content_type"
    t.integer  "gif_file_size"
    t.datetime "gif_updated_at"
    t.string   "photo5_file_name"
    t.string   "photo5_content_type"
    t.integer  "photo5_file_size"
    t.datetime "photo5_updated_at"
    t.string   "photo6_file_name"
    t.string   "photo6_content_type"
    t.integer  "photo6_file_size"
    t.datetime "photo6_updated_at"
    t.string   "photo7_file_name"
    t.string   "photo7_content_type"
    t.integer  "photo7_file_size"
    t.datetime "photo7_updated_at"
    t.string   "photo8_file_name"
    t.string   "photo8_content_type"
    t.integer  "photo8_file_size"
    t.datetime "photo8_updated_at"
    t.text     "photo5_base64"
    t.text     "photo6_base64"
    t.text     "photo7_base64"
    t.text     "photo8_base64"
    t.string   "framed_file_name"
    t.string   "framed_content_type"
    t.integer  "framed_file_size"
    t.datetime "framed_updated_at"
    t.text     "framed_base64"
    t.integer  "frame_id"
  end

  add_index "photo_sets", ["frame_id"], name: "index_photo_sets_on_frame_id"

  create_table "photos", force: :cascade do |t|
    t.string   "family_name",          limit: 255
    t.string   "mdn",                  limit: 255
    t.text     "content_base64"
    t.string   "content_type",         limit: 255
    t.string   "content_filename",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "content_file_name",    limit: 255
    t.string   "content_content_type", limit: 255
    t.integer  "content_file_size"
    t.datetime "content_updated_at"
    t.string   "framed_file_name",     limit: 255
    t.string   "framed_content_type",  limit: 255
    t.integer  "framed_file_size"
    t.datetime "framed_updated_at"
    t.text     "framed_base64"
    t.string   "framed_filename",      limit: 255
    t.string   "framed_type",          limit: 255
    t.integer  "stop_id"
  end

  add_index "photos", ["stop_id"], name: "index_photos_on_stop_id"

  create_table "stops", force: :cascade do |t|
    t.date     "date"
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
