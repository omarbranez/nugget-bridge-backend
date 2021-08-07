class CreateTeamPokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :team_pokemons do |t|
      t.integer :pokemon_id
      t.integer :ability_id
      t.integer :inherited_hp
      t.integer :effort_hp
      t.integer :inherited_attack
      t.integer :effort_attack
      t.integer :inherited_defense
      t.integer :effort_defense
      t.integer :inherited_special_attack
      t.integer :effort_special_attack
      t.integer :inherited_special_defense
      t.integer :effort_special_defense
      t.integer :inherited_speed
      t.integer :effort_speed
      t.integer :move_1
      t.integer :move_2
      t.integer :move_3
      t.integer :move_4
      t.integer :gender_id
      t.integer :nature_id
      t.integer :item_id
      t.boolean :shiny
      t.timestamps
    end
  end
end
