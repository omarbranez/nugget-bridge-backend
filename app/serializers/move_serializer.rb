class MoveSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    # belongs_to :type
    
    attributes :name, :pp
    attributes :type do |move|
        Type.find(move.type_id).name
    end
    attributes :power,
    :priority,
    :effect_chance,
    :accuracy,
    :flavor_text,
    :damage_type,
    :effect

end