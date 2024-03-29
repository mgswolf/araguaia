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

ActiveRecord::Schema.define(:version => 20130309182920) do

  create_table "banners", :force => true do |t|
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "title",              :null => false
    t.text     "description"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.string   "phone"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "equipment", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "slug"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "equipment", ["slug"], :name => "index_equipment_on_slug", :unique => true

  create_table "job_images", :force => true do |t|
    t.integer  "job_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  add_index "job_images", ["job_id"], :name => "index_job_images_on_job_id"

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.string   "caption"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_index "jobs", ["slug"], :name => "index_jobs_on_slug", :unique => true

  create_table "laboratory_items", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
    t.string   "slug"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "laboratory_items", ["slug"], :name => "index_laboratory_items_on_slug", :unique => true

  create_table "reports", :force => true do |t|
    t.string   "title"
    t.date     "report_date"
    t.text     "description"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "annex_file_name"
    t.string   "annex_content_type"
    t.integer  "annex_file_size"
    t.datetime "annex_updated_at"
  end

  add_index "reports", ["slug"], :name => "index_reports_on_slug", :unique => true
  add_index "reports", ["user_id"], :name => "index_reports_on_user_id"

  create_table "services", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "caption"
    t.boolean  "highlight",          :default => false
    t.string   "slug"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_index "services", ["slug"], :name => "index_services_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "name"
    t.string   "company"
    t.string   "encrypted_password",     :default => "",    :null => false
    t.boolean  "admin",                  :default => false
    t.string   "slug"
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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
