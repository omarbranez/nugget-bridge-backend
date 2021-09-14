class UserSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    has_many :team_pokemons, serializer: TeamPokemonSerializer

    attributes :name, :victories, :user_type, :team_size
    # attributes :my_team do |user|
    #     user.team_pokemons.collect do |pokemon|
    #         {
    #             userID: pokemon.user_id,
    #             teamPokemonID: pokemon.id,
    #             position: pokemon.position,
    #             name: Pokemon.find(pokemon.pokemon_id).name.titleize,
    #             type1: Type.find(Pokemon.find(pokemon.pokemon_id).type_slot_1),
    #             type2: Type.find_by(id: Pokemon.find_by(id: pokemon.pokemon_id).type_slot_2),
    #             currentHP: pokemon.current_hp,
    #             status: pokemon.current_status,
    #             hpStat: pokemon.calculate_hp_stat,
    #             attackStat: pokemon.calculate_stat("base_attack", "inherited_attack", "effort_attack"),
    #             defenseStat: pokemon.calculate_stat("base_defense", "inherited_defense", "effort_defense"),
    #             specialAttackStat: pokemon.calculate_stat("base_special_attack", "inherited_special_attack", "effort_special_attack"),
    #             specialDefenseStat: pokemon.calculate_stat("base_special_defense", "inherited_special_defense", "effort_special_defense"),
    #             speedStat: pokemon.calculate_stat("base_speed", "inherited_speed", "effort_speed"),
    #             firstMove:  MoveSerializer.new(Move.find(pokemon.move_1)),
    #             secondMove: MoveSerializer.new(Move.find(pokemon.move_2)),
    #             thirdMove: MoveSerializer.new(Move.find(pokemon.move_3)),
    #             fourthMove: MoveSerializer.new(Move.find(pokemon.move_4))
    #         }
    #     end
    # end


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