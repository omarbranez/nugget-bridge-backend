class TeamPokemonSerializer# < ActiveModel::Serializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    belongs_to :pokemon, serializer: TypeSerializer
    # belongs_to :move, serializer: MoveSerializer
    belongs_to :user, serializer: UserSerializer

    attribute :user_id do |team_pokemon|
        team_pokemon.user_id
    end 
    attribute :team_pokemon_id do |team_pokemon|
        team_pokemon.id
    end 
    attribute :position do |team_pokemon|
        team_pokemon.position
    end 
    attribute :name do |team_pokemon|
        Pokemon.find(team_pokemon.pokemon_id).name.titleize
    end 
    attribute :type1 do |team_pokemon|
        Type.find(Pokemon.find(team_pokemon.pokemon_id).type_slot_1)
    end 
    attribute :type2 do |team_pokemon|
        Type.find_by(id: Pokemon.find_by(id: team_pokemon.pokemon_id).type_slot_2)
    end 
    attribute :current_hp do |team_pokemon|
        team_pokemon.current_hp
    end 
    attribute :status do |team_pokemon|
        team_pokemon.current_status
    end 
    attribute :hp_stat do |team_pokemon|
        team_pokemon.calculate_hp_stat
    end 
    attribute :attackStat do |team_pokemon|
        team_pokemon.calculate_stat("base_attack", "inherited_attack", "effort_attack")
    end
    attribute :defenseStat do |team_pokemon|
        team_pokemon.calculate_stat("base_defense", "inherited_defense", "effort_defense")
    end
    attribute :specialAttackStat do |team_pokemon|
        team_pokemon.calculate_stat("base_special_attack", "inherited_special_attack", "effort_special_attack")
    end
    attribute :specialDefenseStat do |team_pokemon|
        team_pokemon.calculate_stat("base_special_defense", "inherited_special_defense", "effort_special_defense")
    end
    attribute :speedStat do |team_pokemon|
        team_pokemon.calculate_stat("base_speed", "inherited_speed", "effort_speed")
    end
    attribute :firstMove do |team_pokemon|
        MoveSerializer.new(Move.find(team_pokemon.move_1))
    end
    attribute :secondMove do |team_pokemon|
        MoveSerializer.new(Move.find(team_pokemon.move_2))
    end
    attribute :thirdMove do |team_pokemon|
        MoveSerializer.new(Move.find(team_pokemon.move_3))
    end
    attribute :fourthMove do |team_pokemon|
        MoveSerializer.new(Move.find(team_pokemon.move_4))
    end
    # # :gender_id,
    # # :nature_id,
    # # :item_id,
    # # :shiny

end