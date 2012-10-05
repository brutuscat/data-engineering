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

ActiveRecord::Schema.define(:version => 20121005142140) do

  create_table "items", :force => true do |t|
    t.text     "description"
    t.decimal  "price",       :precision => 9, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "items_purchases", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "purchase_id"
  end

  add_index "items_purchases", ["item_id"], :name => "index_items_purchases_on_item_id"
  add_index "items_purchases", ["purchase_id"], :name => "index_items_purchases_on_purchase_id"

  create_table "merchants", :force => true do |t|
    t.text     "address"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "purchasers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "purchaser_id"
    t.integer  "merchant_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "purchases", ["merchant_id"], :name => "index_purchases_on_merchant_id"
  add_index "purchases", ["purchaser_id"], :name => "index_purchases_on_purchaser_id"

end
