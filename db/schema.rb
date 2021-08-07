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

ActiveRecord::Schema.define(version: 2021_08_06_002014) do

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "flavor_text"
    t.string "effect"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "field_effects", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "fling_effect"
    t.integer "fling_power"
    t.string "effect"
    t.string "flavor_text"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "pp"
    t.integer "type_id"
    t.integer "power"
    t.integer "priority"
    t.integer "effect_chance"
    t.integer "accuracy"
    t.string "flavor_text"
    t.string "damage_type"
    t.string "effect"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "natures", force: :cascade do |t|
    t.string "name"
    t.string "likes_flavor"
    t.string "hates_flavor"
    t.string "increased_stat"
    t.string "decreased_stat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.string "evolution_level"
    t.integer "type_list"
    t.integer "ability_list"
    t.integer "base_hp"
    t.integer "base_attack"
    t.integer "base_defense"
    t.integer "base_special_attack"
    t.integer "base_special_defense"
    t.integer "base_speed"
    t.integer "weight"
    t.string "move_list"
    t.string "gender_list"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "team_pokemons", force: :cascade do |t|
    t.integer "pokemon_id"
    t.integer "ability_id"
    t.integer "inherited_hp"
    t.integer "effort_hp"
    t.integer "inherited_attack"
    t.integer "effort_attack"
    t.integer "inherited_defense"
    t.integer "effort_defense"
    t.integer "inherited_special_attack"
    t.integer "effort_special_attack"
    t.integer "inherited_special_defense"
    t.integer "effort_special_defense"
    t.integer "inherited_speed"
    t.integer "effort_speed"
    t.integer "move_1"
    t.integer "move_2"
    t.integer "move_3"
    t.integer "move_4"
    t.integer "gender_id"
    t.integer "nature_id"
    t.integer "item_id"
    t.boolean "shiny"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.string "no_damage_to"
    t.string "half_damage_to"
    t.string "double_damage_to"
    t.string "no_damage_from"
    t.string "half_damage_from"
    t.string "double_damage_from"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "current_team"
    t.integer "victories"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
