# Author: Sam

ActiveRecord::Schema.define(version: 20180930205850) do

  create_table "houses", force: :cascade do |t|
    t.integer "company_id"
    t.string "location"
    t.string "square_footage"
    t.integer "year"
    t.string "style"
    t.integer "price"
    t.integer "floors"
    t.boolean "basement"
    t.string "owner"
  end

  create_table "inquiries", force: :cascade do |t|
    t.integer "house_id"
    t.integer "user_id"
    t.string "subject"
    t.string "message"
  end

  create_table "real_estate_companies", force: :cascade do |t|
    t.string "name"
    t.string "website"
    t.string "address"
    t.string "size"
    t.decimal "founded"
    t.string "revenue"
    t.string "synopsis"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "company_id"
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.decimal "roles"
    t.string "phone_number"
    t.string "preferred_contact_method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
