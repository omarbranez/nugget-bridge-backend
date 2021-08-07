# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'poke-api-v2'
# types = PokeApi.get(:type).results
# types.each do |type|
#     type_hash = {}
#     type_hash[:name] = type.name.titleize
#     type_hash[:no_damage_to] = JSON.parse((Mechanize.new.get(type.url).body))["damage_relations"]["no_damage_to"].map {|t| t["name"].titleize }.join(", ")
#     type_hash[:half_damage_to] = JSON.parse((Mechanize.new.get(type.url).body))["damage_relations"]["half_damage_to"].map {|t| t["name"].titleize }.join(", ")
#     type_hash[:double_damage_to] = JSON.parse((Mechanize.new.get(type.url).body))["damage_relations"]["double_damage_to"].map {|t| t["name"].titleize }.join(", ")
#     type_hash[:no_damage_from] = JSON.parse((Mechanize.new.get(type.url).body))["damage_relations"]["no_damage_from"].map {|t| t["name"].titleize }.join(", ")
#     type_hash[:half_damage_from] = JSON.parse((Mechanize.new.get(type.url).body))["damage_relations"]["half_damage_from"].map {|t| t["name"].titleize }.join(", ")
#     type_hash[:double_damage_from] = JSON.parse((Mechanize.new.get(type.url).body))["damage_relations"]["double_damage_from"].map {|t| t["name"].titleize }.join(", ")
#     Type.where(type_hash).first_or_create
# end

# natures = PokeApi.get(:nature).results
# natures.each do |nature|
#     nature_hash = {}
#     nature_hash[:name] = nature.name.titleize
#     nature_hash[:likes_flavor] = JSON.parse((Mechanize.new.get(nature.url).body))["likes_flavor"].present? ? JSON.parse((Mechanize.new.get(nature.url).body))["likes_flavor"]["name"].titleize : ""
#     nature_hash[:hates_flavor] = JSON.parse((Mechanize.new.get(nature.url).body))["hates_flavor"].present? ? JSON.parse((Mechanize.new.get(nature.url).body))["hates_flavor"]["name"].titleize : ""
#     nature_hash[:increased_stat] = JSON.parse((Mechanize.new.get(nature.url).body))["increased_stat"].present? ? JSON.parse((Mechanize.new.get(nature.url).body))["increased_stat"]["name"].titleize : ""
#     nature_hash[:decreased_stat] = JSON.parse((Mechanize.new.get(nature.url).body))["decreased_stat"].present? ? JSON.parse((Mechanize.new.get(nature.url).body))["decreased_stat"]["name"].titleize : ""
#     Nature.where(nature_hash).first_or_create
# end

# items = PokeApi.get(item: {limit: 999}).results
# items.each do |item|
#     item_hash = {}
#     # if !!JSON.parse((Mechanize.new.get(item.url).body))["category"]["name"] == "held-items" && !JSON.parse((Mechanize.new.get(item.url).body))["attributes"].find { |n| n["name"] == "consumable" }
#     # if !!JSON.parse((Mechanize.new.get(item.url).body))["attributes"].find { |n| n["name"] == "holdable-active" }# && 
#     if JSON.parse((Mechanize.new.get(item.url).body))["category"]["name"] == "held-items"
#         item_hash[:name] = item.name.titleize
#         item_hash[:fling_effect] = JSON.parse((Mechanize.new.get(item.url).body))["fling_effect"].present? ? JSON.parse(Mechanize.new.get(JSON.parse((Mechanize.new.get(item.url).body))["fling_effect"]["url"]).body)["effect_entries"].first["effect"] : ""
#         item_hash[:fling_power] = JSON.parse((Mechanize.new.get(item.url).body))["fling_power"].present? ? JSON.parse((Mechanize.new.get(item.url).body))["fling_power"] : ""
#         item_hash[:effect] = JSON.parse((Mechanize.new.get(item.url).body))["effect_entries"].first["effect"].gsub("\n","")
#         item_hash[:flavor_text] = JSON.parse((Mechanize.new.get(item.url).body))["flavor_text_entries"].find { |n| n["language"]["name"] == "en" }["text"].gsub("\n"," ")
#         Item.where(item_hash).first_or_create
#     end
# end

# abilities = PokeApi.get(ability: { limit: 999 }).results
# abilities.each do |ability|
#     ability_hash = {}
#     ability_hash[:name] = ability.name.titleize
#     ability_hash[:flavor_text] = !JSON.parse((Mechanize.new.get(ability.url).body))["effect_entries"].empty? ? JSON.parse((Mechanize.new.get(ability.url).body))["effect_entries"].find { |n| n["language"]["name"] == "en" }["short_effect"] : JSON.parse((Mechanize.new.get(ability.url).body))["flavor_text_entries"].first["flavor_text"] # doesnt work past ability 268, those are for pokemon conquest
#     ability_hash[:effect] = !JSON.parse((Mechanize.new.get(ability.url).body))["effect_entries"].empty? ? JSON.parse((Mechanize.new.get(ability.url).body))["effect_entries"].find { |n| n["language"]["name"] == "en" }["effect"].gsub("\n"," ") : JSON.parse((Mechanize.new.get(ability.url).body))["flavor_text_entries"].first["flavor_text"]
#     Ability.where(ability_hash).first_or_create
# end

moves = PokeApi.get(move: { limit: 999 }).results
moves.each do |move|
    move_hash = {}
    move_hash[:name] = move.name.titleize
    # binding.pry
    move_hash[:pp] = JSON.parse((Mechanize.new.get(move.url).body))["pp"]
    move_hash[:type_id] = Type.find_by(name: JSON.parse((Mechanize.new.get(move.url).body))["type"]["name"].titleize).id
    move_hash[:power] = JSON.parse((Mechanize.new.get(move.url).body))["power"]
    move_hash[:priority] = JSON.parse((Mechanize.new.get(move.url).body))["priority"]
    move_hash[:accuracy] = JSON.parse((Mechanize.new.get(move.url).body))["accuracy"]
    move_hash[:effect] = JSON.parse((Mechanize.new.get(move.url).body))["effect_entries"].find { |n| n["language"]["name"] == "en" }["effect"]
    move_hash[:effect_chance] = !JSON.parse((Mechanize.new.get(move.url).body))["effect_chance"].nil? ? JSON.parse((Mechanize.new.get(move.url).body))["effect_chance"] : ""
    move_hash[:flavor_text] = JSON.parse((Mechanize.new.get(move.url).body))["flavor_text_entries"].find { |n| n["language"]["name"] == "en" && n["version_group"]["name"] == "ultra-sun-ultra-moon" }["flavor_text"].gsub("\n","")
    move_hash[:damage_type] = JSON.parse((Mechanize.new.get(move.url).body))["damage_class"]["name"].titleize
    Move.where(move_hash).first_or_create
    # stopped at 728
end
