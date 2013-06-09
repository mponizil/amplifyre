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

ActiveRecord::Schema.define(:version => 20130609172733) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
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

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "albums", :force => true do |t|
    t.integer  "band_site_id"
    t.string   "title"
    t.string   "cover_file"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "description"
  end

  create_table "band_sites", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.string   "description"
    t.string   "title"
    t.string   "phrase"
    t.string   "background_file"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "theme",           :default => "press-play"
    t.string   "homepage",        :default => "landing"
    t.string   "ga",              :default => "UA-36251718-1"
  end

  create_table "collaborators", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "band_site_id"
  end

  add_index "collaborators", ["band_site_id", "user_id"], :name => "index_band_sites_users_on_band_site_id_and_user_id"
  add_index "collaborators", ["user_id", "band_site_id"], :name => "index_band_sites_users_on_user_id_and_band_site_id"

  create_table "concerts", :force => true do |t|
    t.integer  "band_site_id"
    t.date     "date"
    t.string   "venue"
    t.text     "details"
    t.string   "photo_file"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.string   "link"
  end

  create_table "pages", :force => true do |t|
    t.integer  "band_site_id"
    t.integer  "position"
    t.string   "category",     :default => "custom"
    t.string   "slug"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "band_site_id"
    t.string   "file"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "band_site_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "socials", :force => true do |t|
    t.integer  "band_site_id"
    t.string   "category"
    t.string   "link"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "subscribers", :force => true do |t|
    t.integer  "band_site_id"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "tracks", :force => true do |t|
    t.integer  "band_site_id"
    t.integer  "album_id"
    t.integer  "position"
    t.string   "title"
    t.string   "file"
    t.string   "artist"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], :name => "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
