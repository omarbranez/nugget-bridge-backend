class UserSerializer# < ActiveModel::Serializer
    include JSONAPI::Serializer
    set_key_transform :camel
    has_many :team_pokemons, serializer: TeamPokemonSerializer
    # if: Proc.new { |record| record.team_pokemons.any? }

    attributes :name
    attributes :team_size
    attributes :my_team do |user|
        user.team_pokemons.collect do |pokemon|
            {
                position: pokemon.position,
                name: Pokemon.find(pokemon.pokemon_id).name.titleize,
                hp_stat: pokemon.calculate_hp_stat,
                attack_stat: pokemon.calculate_stat("base_attack", "inherited_attack", "effort_attack"),
                defense_stat: pokemon.calculate_stat("base_defense", "inherited_defense", "effort_defense"),
                special_attack_stat: pokemon.calculate_stat("base_special_attack", "inherited_special_attack", "effort_special_attack"),
                special_defense_stat: pokemon.calculate_stat("base_special_defense", "inherited_special_defense", "effort_special_defense"),
                speed_stat: pokemon.calculate_stat("base_speed", "inherited_speed", "effort_speed"),
                first_move: Move.find(pokemon.move_1).name,
                second_move: Move.find(pokemon.move_2).name,
                third_move: Move.find(pokemon.move_3).name,
                fourth_move: Move.find(pokemon.move_4).name,
            }
        end
    end

    meta do |user|
        {
            TeamSize: user.team_pokemons.count
        }
    end
end