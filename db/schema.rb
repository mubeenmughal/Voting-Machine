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

ActiveRecord::Schema.define(version: 2021_12_15_104246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "candidateships", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.bigint "user_id"
    t.bigint "party_id"
    t.bigint "polling_id"
    t.bigint "constituency_id"
    t.index ["constituency_id"], name: "index_candidateships_on_constituency_id"
    t.index ["party_id"], name: "index_candidateships_on_party_id"
    t.index ["polling_id"], name: "index_candidateships_on_polling_id"
    t.index ["user_id"], name: "index_candidateships_on_user_id"
  end

  create_table "constituencies", force: :cascade do |t|
    t.string "name", null: false
    t.index ["name"], name: "index_constituencies_on_name", unique: true
  end

  create_table "parties", force: :cascade do |t|
    t.string "name", null: false
    t.string "symbol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_parties_on_name", unique: true
  end

  create_table "pollings", force: :cascade do |t|
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.string "cnic", null: false
    t.integer "role", default: 1, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "constituency_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["cnic"], name: "index_users_on_cnic", unique: true
    t.index ["constituency_id"], name: "index_users_on_constituency_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "constituency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "candidate_id", null: false
    t.bigint "voter_id", null: false
    t.bigint "polling_id"
    t.index ["candidate_id"], name: "index_votes_on_candidate_id"
    t.index ["constituency_id"], name: "index_votes_on_constituency_id"
    t.index ["polling_id"], name: "index_votes_on_polling_id"
    t.index ["voter_id", "polling_id", "constituency_id"], name: "index_votes_on_voter_id_and_polling_id_and_constituency_id", unique: true
    t.index ["voter_id"], name: "index_votes_on_voter_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "candidateships", "constituencies"
  add_foreign_key "candidateships", "parties"
  add_foreign_key "candidateships", "pollings"
  add_foreign_key "candidateships", "users"
  add_foreign_key "users", "constituencies"
  add_foreign_key "votes", "constituencies"
  add_foreign_key "votes", "pollings"
  add_foreign_key "votes", "users", column: "candidate_id"
  add_foreign_key "votes", "users", column: "voter_id"
end
