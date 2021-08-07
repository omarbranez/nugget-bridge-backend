class User < ActiveRecord::Base
    has_many :team_pokemons
    has_many :pokemon, through: :team_pokemons
end