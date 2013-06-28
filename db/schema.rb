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

ActiveRecord::Schema.define(:version => 20130625171309) do

  create_table "beers", :force => true do |t|
    t.string   "beer_name",   :limit => 50
    t.string   "beer_type",   :limit => 100
    t.text     "history"
    t.string   "flavor_prof"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.string   "ing_name"
    t.string   "ing_type",   :limit => 25
    t.string   "color",      :limit => 25
    t.string   "flav_prof"
    t.string   "other"
    t.string   "srm_ibu",    :limit => 25
    t.string   "image_url"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "ingredients_recipes", :force => true do |t|
    t.integer  "beer_recipes_id"
    t.integer  "ingredients_id"
    t.integer  "equipment_id"
    t.string   "amount",          :limit => 50
    t.string   "add_time",        :limit => 25
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "username",   :limit => 25
    t.string   "password",   :limit => 25
    t.string   "mem_type",   :limit => 25
    t.string   "first_name", :limit => 25
    t.string   "last_name",  :limit => 25
    t.string   "email"
    t.string   "other"
    t.string   "reviews"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "recipe_name",        :limit => 50
    t.string   "recipe_type",        :limit => 50
    t.string   "brew_date",          :limit => 50
    t.string   "yeast_starter",      :limit => 5
    t.string   "batch_size",         :limit => 50
    t.string   "mash_time",          :limit => 10
    t.string   "mash_temp",          :limit => 10
    t.string   "mash_steps",         :limit => 50
    t.string   "boil_time",          :limit => 50
    t.integer  "pri_ferm_days"
    t.string   "pri_ferm_temp",      :limit => 10
    t.string   "pri_ferm_notes"
    t.integer  "sec_ferm_days"
    t.string   "sec_ferm_temp",      :limit => 10
    t.string   "sec_ferm_notes"
    t.integer  "org_gravity"
    t.integer  "org_gravity_temp"
    t.integer  "final_gravity"
    t.integer  "final_gravity_temp"
    t.string   "ibu",                :limit => 10
    t.string   "color",              :limit => 10
    t.string   "cooking_steps"
    t.integer  "taste_rating"
    t.string   "tasting_notes"
    t.string   "review"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "reviews", :force => true do |t|
    t.string   "review_title"
    t.integer  "member_id"
    t.integer  "beer_recipes_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
