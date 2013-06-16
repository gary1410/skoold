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

ActiveRecord::Schema.define(:version => 20130616164941) do

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
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "device_id"
    t.boolean  "super_user",             :default => false, :null => false
    t.integer  "child_id"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "case_histories", :force => true do |t|
    t.integer  "case_id"
    t.integer  "admin_user_id"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "comment"
  end

  create_table "cases", :force => true do |t|
    t.integer  "student_id"
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.integer  "class_room_id"
    t.string   "message"
    t.string   "memo"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.float    "severity"
  end

  create_table "class_rooms", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "picture"
    t.string   "description"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "first_name"
    t.string   "date_of_birth"
    t.string   "parent_first_name"
    t.string   "parent_last_name"
    t.string   "parent_phone_number"
    t.string   "parent_email"
    t.string   "city"
    t.string   "sex",                 :default => "f", :null => false
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "name"
    t.string   "teacher_id"
    t.string   "device_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "password"
    t.string   "login"
    t.string   "first_name"
  end

  create_table "timetables", :force => true do |t|
    t.integer  "class_room_id"
    t.integer  "subject_id"
    t.integer  "teacher_id"
    t.integer  "student_id"
    t.string   "day_of_week"
    t.string   "hour"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
