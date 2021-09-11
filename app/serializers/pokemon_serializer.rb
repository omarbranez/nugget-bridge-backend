class PokemonSerializer
    include JSONAPI::Serializer
    attributes :name, 
    :base_hp, 
    :base_attack, 
    :base_defense, 
    :base_special_attack, 
    :base_special_defense, 
    :base_speed, 
    :type_slot_1, 
    :type_slot_2, 
    :move_list
end