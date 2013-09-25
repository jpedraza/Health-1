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

ActiveRecord::Schema.define(:version => 20130924220316) do

  create_table "articles", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "calories", :force => true do |t|
    t.date     "date_of_entry"
    t.decimal  "protein"
    t.decimal  "fat"
    t.decimal  "carbs"
    t.decimal  "fiber"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.decimal  "points"
    t.decimal  "calories"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "password_confirmation"
    t.integer  "points"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "salt"
    t.string   "encrypted_password"
  end

  create_table "weights", :force => true do |t|
    t.date     "date_of_entry"
    t.decimal  "weight"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
