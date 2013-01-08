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

ActiveRecord::Schema.define(:version => 20130108190008) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "ignore",     :default => false
  end

  create_table "entries", :force => true do |t|
    t.string   "raw_name"
    t.decimal  "amount",          :precision => 15, :scale => 2
    t.datetime "date"
    t.integer  "account_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
    t.integer  "final_name_id"
    t.integer  "category_id"
    t.text     "comment"
    t.integer  "import_batch_id"
  end

  add_index "entries", ["account_id"], :name => "index_entries_on_account_id"

  create_table "final_names", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "category_id"
  end

  create_table "import_batches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "raw_to_final_name_mappings", :force => true do |t|
    t.string   "name"
    t.integer  "account_id"
    t.integer  "final_name_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "raw_to_final_name_mappings", ["account_id"], :name => "index_raw_to_final_name_mappings_on_account_id"
  add_index "raw_to_final_name_mappings", ["final_name_id"], :name => "index_raw_to_final_name_mappings_on_final_name_id"

end
