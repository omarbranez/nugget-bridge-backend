class Type < ActiveRecord::Base
    has_many :pokemons
    has_many :moves
end