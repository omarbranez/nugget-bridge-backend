# class MoveSerializer
#     include JSONAPI::Serializer
#     set_key_transform :camel_lower
#     # belongs_to :type
    
#     attributes :name, :pp
#     attributes :type do |move|
#         Type.find(move.type_id)
#     end
#     attributes :power,
#     :priority,
#     :effect_chance,
#     :accuracy,
#     :flavor_text,
#     :damage_type,
#     :effect

# end

class MoveSerializer
    include JSONAPI::Serializer
    set_key_transform :camel_lower
    belongs_to :type, serializer: TypeSerializer
    
    attributes :name, :pp
    attributes :type do |move|
        Type.find(move.type_id) # may insert TypeSerializer.new so we can do a split on the effectiveness strings
    end
    attributes :power,
    :priority,
    :effect_chance,
    :accuracy,
    :flavor_text,
    :damage_type,
    :effect

end