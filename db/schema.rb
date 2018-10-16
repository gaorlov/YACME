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

ActiveRecord::Schema.define(version: 20181015230245) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actions", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "app_component_dependencies", force: :cascade do |t|
    t.bigint "parent_id"
    t.bigint "dependent_id"
    t.index ["dependent_id"], name: "index_app_component_dependencies_on_dependent_id"
    t.index ["parent_id"], name: "index_app_component_dependencies_on_parent_id"
  end

  create_table "app_component_groups", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "app_component_group_id"
    t.index ["app_component_group_id"], name: "index_app_component_groups_on_app_component_group_id"
    t.index ["group_id"], name: "index_app_component_groups_on_group_id"
  end

  create_table "app_component_params", force: :cascade do |t|
    t.bigint "app_component_id"
    t.bigint "component_param_id"
    t.string "value"
    t.index ["app_component_id"], name: "index_app_component_params_on_app_component_id"
    t.index ["component_param_id"], name: "index_app_component_params_on_component_param_id"
  end

  create_table "app_components", force: :cascade do |t|
    t.bigint "app_id"
    t.bigint "component_id"
    t.bigint "environment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_components_on_app_id"
    t.index ["component_id"], name: "index_app_components_on_component_id"
    t.index ["environment_id"], name: "index_app_components_on_environment_id"
  end

  create_table "app_environments", force: :cascade do |t|
    t.bigint "app_id"
    t.bigint "environment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_environments_on_app_id"
    t.index ["environment_id"], name: "index_app_environments_on_environment_id"
  end

  create_table "app_groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "app_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["app_id"], name: "index_app_groups_on_app_id"
  end

  create_table "apps", force: :cascade do |t|
    t.string "name", null: false
    t.string "repo", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "component_actions", force: :cascade do |t|
    t.bigint "component_id"
    t.bigint "action_id"
    t.index ["action_id"], name: "index_component_actions_on_action_id"
    t.index ["component_id"], name: "index_component_actions_on_component_id"
  end

  create_table "component_params", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "type"
    t.bigint "component_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["component_id"], name: "index_component_params_on_component_id"
  end

  create_table "component_types", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "components", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "url_slug"
    t.string "description"
    t.bigint "type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type_id"], name: "index_components_on_type_id"
  end

  create_table "environments", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
