# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_240_101_000_000) do
  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age"
    t.string "email"
    t.timestamps
  end

  create_table "posts", force: :cascade do |t|
    t.integer "author_id", null: false
    t.string "title", null: false
    t.text "description"
    t.string "category"
    t.boolean "published", default: false
    t.timestamps
    t.index ["author_id"], name: "index_posts_on_author_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.timestamps
  end

  create_table "post_tags", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "tag_id", null: false
    t.timestamps
    t.index ["post_id"], name: "index_post_tags_on_post_id"
    t.index ["tag_id"], name: "index_post_tags_on_tag_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.timestamps
    t.index ["email"], name: "index_admin_users_on_email", unique: true
  end

  add_foreign_key "posts", "authors"
  add_foreign_key "post_tags", "posts"
  add_foreign_key "post_tags", "tags"
end
