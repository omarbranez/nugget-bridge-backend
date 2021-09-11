class TeamPokemonSerializer# < ActiveModel::Serializer
    include JSONAPI::Serializer
    set_key_transform :camel
    belongs_to :pokemon, serializer: TypeSerializer
    # belongs_to :move, serializer: MoveSerializer
    belongs_to :user, serializer: UserSerializer

    attributes :pokemon_id,
    :user_id,
    :ability_id,
    :inherited_hp,
    :effort_hp,
    :inherited_attack,
    :effort_attack,
    :inherited_defense,
    :effort_defense,
    :inherited_special_attack,
    :effort_special_attack,
    :inherited_special_defense,
    :effort_special_defense,
    :inherited_speed,
    :effort_speed,
    :move_1,
    :move_2,
    :move_3,
    :move_4

    # attribute :name do |pokemon|
    #     Pokemon.find(pokemon.pokemon_id).name.titleize
    # end

    # attribute :hp_stat do |pokemon|
    #     TeamPokemon.find(pokemon.user_id).calculate_hp_stat
    # end

    # attribute :attack_stat do |pokemon|
    #     TeamPokemon.find(pokemon.user_id).calculate_stat("base_attack", "inherited_attack", "effort_attack")
    # end

    # attribute :defense_stat do |pokemon|
    #     TeamPokemon.find(pokemon.user_id).calculate_stat("base_defense", "inherited_defense", "effort_defense")
    # end

    # attribute :special_attack_stat do |pokemon|
    #     TeamPokemon.find(pokemon.user_id).calculate_stat("base_special_attack", "inherited_special_attack", "effort_special_attack")
    # end

    # attribute :special_defense_stat do |pokemon|
    #     TeamPokemon.find(pokemon.user_id).calculate_stat("base_special_defense", "inherited_special_defense", "effort_special_defense")
    # end

    # attribute :speed_stat do |pokemon|
    #     TeamPokemon.find(pokemon.user_id).calculate_stat("base_speed", "inherited_speed", "effort_speed")
    # end

    # attribute :first_move do |pokemon|
    #     Move.find(pokemon.move_1).name
    # end

    # attribute :second_move do |pokemon|
    #     Move.find(pokemon.move_2).name
    # end

    # attribute :third_move do |pokemon|
    #     Move.find(pokemon.move_3).name
    # end

    # attribute :fourth_move do |pokemon|
    #     Move.find(pokemon.move_4).name
    # end
    # # :gender_id,
    # # :nature_id,
    # # :item_id,
    # # :shiny
    belongs_to :pokemon
    belongs_to :user

end