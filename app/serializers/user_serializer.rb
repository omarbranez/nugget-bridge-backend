class UserSerializer# < ActiveModel::Serializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    has_many :team_pokemons, serializer: TeamPokemonSerializer


    attributes :name, :team_size
    attributes :my_team do |user|
        user.team_pokemons.collect do |pokemon|
            {
                userID: pokemon.user_id,
                position: pokemon.position,
                name: Pokemon.find(pokemon.pokemon_id).name.titleize,
                currentHP: pokemon.current_hp,
                status: pokemon.current_status,
                hpStat: pokemon.calculate_hp_stat,
                attackStat: pokemon.calculate_stat("base_attack", "inherited_attack", "effort_attack"),
                defenseStat: pokemon.calculate_stat("base_defense", "inherited_defense", "effort_defense"),
                specialAttackStat: pokemon.calculate_stat("base_special_attack", "inherited_special_attack", "effort_special_attack"),
                specialDefenseStat: pokemon.calculate_stat("base_special_defense", "inherited_special_defense", "effort_special_defense"),
                speedStat: pokemon.calculate_stat("base_speed", "inherited_speed", "effort_speed"),
                firstMove: Move.find(pokemon.move_1).name,
                secondMove: Move.find(pokemon.move_2).name,
                thirdMove: Move.find(pokemon.move_3).name,
                fourthMove: Move.find(pokemon.move_4).name
            }
        end
    end
    
    meta do |user|
        {
            TeamSize: user.team_pokemons.count
        }
    end


    def team
        object.team_pokemons.map do |pokemon|
            ::TeamPokemonSerializer.new(pokemon).attributes
        end
    end

end