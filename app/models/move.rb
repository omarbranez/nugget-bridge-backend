class Move < ActiveRecord::Base 
    belongs_to :type
    # has_and_belongs_to_many :pokemons
    belongs_to :team_pokemon
end