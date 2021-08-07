class CreatePokemons < ActiveRecord::Migration[6.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :evolution_level
      t.integer :type_list
      t.integer :ability_list
      t.integer :base_hp
      t.integer :base_attack
      t.integer :base_defense
      t.integer :base_special_attack
      t.integer :base_special_defense
      t.integer :base_speed
      t.integer :weight
      t.string :move_list
      t.string :gender_list
      t.timestamps
    end
  end
end
