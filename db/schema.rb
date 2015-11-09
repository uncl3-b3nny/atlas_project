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

ActiveRecord::Schema.define(version: 20151104163156) do

  create_table "a2s", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
  end

  create_table "a3s", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
  end

  create_table "a4s", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
  end

  create_table "a5s", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       limit: 255
  end

  create_table "assemblies", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity_id", limit: 4
  end

  create_table "atlas_registrations", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blueprints", force: :cascade do |t|
    t.integer  "lot_id",      limit: 4
    t.integer  "building_id", limit: 4
    t.integer  "part_id",     limit: 4
    t.integer  "assembly_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "building_products", force: :cascade do |t|
    t.integer "building_id", limit: 4
    t.integer "product_id",  limit: 4
    t.integer "quantity",    limit: 4
  end

  create_table "buildings", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lot_id",        limit: 4
    t.integer  "deed_id",       limit: 4
    t.string   "building_type", limit: 255
    t.boolean  "approved"
    t.integer  "quantity_id",   limit: 4
  end

  create_table "catalogue_designs", force: :cascade do |t|
    t.integer  "catalogue_id", limit: 4
    t.integer  "design_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "catalogues", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "region_id",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "construction_schedules", force: :cascade do |t|
    t.integer  "building_id", limit: 4
    t.integer  "lot_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name",                                            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "population",                                      limit: 4
    t.string   "abbreviation",                                    limit: 255
    t.integer  "estimated_occupants_per_single_family_home_unit", limit: 4
    t.integer  "estimated_occupants_per_multi_family_home_unit",  limit: 4
    t.integer  "estimated_single_family_home_demand",             limit: 4
    t.integer  "estimated_multi_family_home_demand",              limit: 4
    t.integer  "percent_market_penetration_goal",                 limit: 4
    t.integer  "average_estimated_home_value",                    limit: 4
    t.integer  "percent_margin",                                  limit: 4
    t.boolean  "approved"
    t.integer  "upkeep_cost_of_means_of_production",              limit: 4
    t.integer  "cost_of_means_of_production",                     limit: 4
    t.integer  "market_price",                                    limit: 4
    t.integer  "market_bulk_discount",                            limit: 4
    t.integer  "additional_discount_needed_to_close_deal",        limit: 4
  end

  create_table "credits", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debts", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deeds", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "participant_id", limit: 4
    t.integer  "development_id", limit: 4
    t.boolean  "approved"
  end

  create_table "design_tags", force: :cascade do |t|
    t.integer  "design_id",  limit: 4
    t.integer  "tag_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "designs", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.string   "designer",                 limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blueprint_id",             limit: 4
    t.integer  "floorplan_id",             limit: 4
    t.integer  "manufacturing_process_id", limit: 4
    t.integer  "catalogue_id",             limit: 4
    t.integer  "a5_id",                    limit: 4
    t.integer  "a4_id",                    limit: 4
    t.integer  "a3_id",                    limit: 4
    t.integer  "a2_id",                    limit: 4
    t.integer  "assembly_id",              limit: 4
    t.integer  "part_id",                  limit: 4
    t.integer  "raw_material_id",          limit: 4
    t.boolean  "engineering_approved"
  end

  create_table "developments", force: :cascade do |t|
    t.string   "name",                                            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "master_plan_id",                                  limit: 4
    t.boolean  "approved"
    t.integer  "population",                                      limit: 4
    t.string   "abbreviation",                                    limit: 255
    t.integer  "estimated_occupants_per_single_family_home_unit", limit: 4
    t.integer  "estimated_occupants_per_multi_family_home_unit",  limit: 4
    t.integer  "estimated_single_family_home_demand",             limit: 4
    t.integer  "estimated_multi_family_home_demand",              limit: 4
    t.integer  "percent_market_penetration_goal",                 limit: 4
    t.integer  "average_estimated_home_value",                    limit: 4
    t.integer  "percent_margin",                                  limit: 4
  end

  create_table "factories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "region_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "factory_manufacturing_processes", force: :cascade do |t|
    t.integer  "factory_id",               limit: 4
    t.integer  "manufacturing_process_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "floorplans", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "building_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "inventories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labors", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lots", force: :cascade do |t|
    t.integer  "development_id", limit: 4
    t.string   "status",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "deed_id",        limit: 4
    t.boolean  "approved"
  end

  create_table "manufacturing_processes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "master_plans", force: :cascade do |t|
    t.string   "name",                                            limit: 255
    t.integer  "region_id",                                       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                                          limit: 255
    t.boolean  "approved"
    t.integer  "population",                                      limit: 4
    t.string   "abbreviation",                                    limit: 255
    t.integer  "estimated_occupants_per_single_family_home_unit", limit: 4
    t.integer  "estimated_occupants_per_multi_family_home_unit",  limit: 4
    t.integer  "estimated_single_family_home_demand",             limit: 4
    t.integer  "estimated_multi_family_home_demand",              limit: 4
    t.integer  "percent_market_penetration_goal",                 limit: 4
    t.integer  "average_estimated_home_value",                    limit: 4
    t.integer  "percent_margin",                                  limit: 4
  end

  create_table "milestones", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

  create_table "natural_resources", force: :cascade do |t|
    t.integer  "name",       limit: 4
    t.integer  "quantity",   limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: ""
    t.string   "encrypted_password",     limit: 255, default: ""
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.boolean  "approved"
  end

  add_index "participants", ["email"], name: "index_participants_on_email", unique: true, using: :btree
  add_index "participants", ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true, using: :btree

  create_table "parts", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_raw_materials", force: :cascade do |t|
    t.integer "raw_material_id",     limit: 4
    t.integer "building_product_id", limit: 4
    t.integer "quantity",            limit: 4
  end

  create_table "products", force: :cascade do |t|
    t.string "name", limit: 255
  end

  create_table "quantities", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
    t.integer  "quantity",        limit: 4
    t.integer  "building_id",     limit: 4
    t.integer  "assembly_id",     limit: 4
    t.integer  "a2_id",           limit: 4
    t.integer  "a3_id",           limit: 4
    t.integer  "a4_id",           limit: 4
    t.integer  "a5_id",           limit: 4
    t.integer  "part_id",         limit: 4
    t.integer  "raw_material_id", limit: 4
    t.integer  "milestone_id",    limit: 4
    t.integer  "labor_id",        limit: 4
    t.integer  "inventory_id",    limit: 4
    t.integer  "credit_id",       limit: 4
    t.integer  "debt_id",         limit: 4
    t.integer  "participant_id",  limit: 4
    t.integer  "design_id",       limit: 4
  end

  create_table "raw_materials", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id",  limit: 4
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name",                                            limit: 255
    t.text     "description",                                     limit: 65535
    t.text     "climate",                                         limit: 65535
    t.integer  "country_id",                                      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
    t.integer  "population",                                      limit: 4
    t.string   "abbreviation",                                    limit: 255
    t.integer  "estimated_occupants_per_single_family_home_unit", limit: 4
    t.integer  "estimated_occupants_per_multi_family_home_unit",  limit: 4
    t.integer  "estimated_single_family_home_demand",             limit: 4
    t.integer  "estimated_multi_family_home_demand",              limit: 4
    t.integer  "percent_market_penetration_goal",                 limit: 4
    t.integer  "average_estimated_home_value",                    limit: 4
    t.integer  "percent_margin",                                  limit: 4
  end

  create_table "registrations", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "region_id",      limit: 4
    t.integer  "participant_id", limit: 4
  end

  create_table "tags", force: :cascade do |t|
    t.integer  "design_id",     limit: 4
    t.string   "category_name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "approved"
  end

end
