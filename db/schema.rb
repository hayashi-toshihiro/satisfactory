# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_07_25_003116) do

  create_table "items", force: :cascade do |t|
    t.string "item_name", null: false
    t.string "item_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "machines", force: :cascade do |t|
    t.string "machine_name", null: false
    t.integer "electricity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recipe_materials", force: :cascade do |t|
    t.integer "material_id"
    t.integer "recipe_id", null: false
    t.float "material_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["material_id"], name: "index_recipe_materials_on_material_id"
    t.index ["recipe_id"], name: "index_recipe_materials_on_recipe_id"
  end

  create_table "recipe_products", force: :cascade do |t|
    t.integer "product_id"
    t.integer "recipe_id", null: false
    t.float "product_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_recipe_products_on_product_id"
    t.index ["recipe_id"], name: "index_recipe_products_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "recipe_name", null: false
    t.integer "machine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["machine_id"], name: "index_recipes_on_machine_id"
  end

  add_foreign_key "recipe_materials", "items", column: "material_id"
  add_foreign_key "recipe_products", "items", column: "product_id"
  add_foreign_key "recipes", "machines"
end
