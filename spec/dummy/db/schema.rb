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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130210201621) do

  create_table "sevenpages_media_files", :force => true do |t|
    t.string   "source"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "title",      :limit => 100
  end

  add_index "sevenpages_media_files", ["title"], :name => "index_sevenpages_media_files_on_title", :unique => true

  create_table "sevenpages_pages", :force => true do |t|
    t.string   "title"
    t.string   "slug",       :limit => 100
    t.text     "content"
    t.boolean  "published",                 :default => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "sevenpages_pages", ["slug"], :name => "index_sevenpages_pages_on_slug", :unique => true

  create_table "sevenpages_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "sevenpages_users", ["email"], :name => "index_sevenpages_users_on_email", :unique => true
  add_index "sevenpages_users", ["reset_password_token"], :name => "index_sevenpages_users_on_reset_password_token", :unique => true

end
