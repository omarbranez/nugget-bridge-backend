class Pokemon < ActiveRecord::Base
    has_many :team_pokemons
    has_many :users, through: :team_pokemons
    # has_and_belongs_to_many :types
end