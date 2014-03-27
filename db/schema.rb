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

ActiveRecord::Schema.define(version: 20140327160940) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["proposal_id"], name: "index_comments_on_proposal_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "proposal_scores", force: true do |t|
    t.integer  "user_id"
    t.integer  "proposal_id"
    t.boolean  "read",        default: false
    t.boolean  "favorite",    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "proposal_scores", ["proposal_id"], name: "index_proposal_scores_on_proposal_id", using: :btree
  add_index "proposal_scores", ["user_id"], name: "index_proposal_scores_on_user_id", using: :btree

  create_table "proposals", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "title"
    t.text     "description"
    t.string   "tags"
    t.text     "bio"
    t.string   "github"
    t.string   "twitter"
    t.string   "recidence"
    t.text     "motivation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier",  null: false
    t.string   "avatar"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
