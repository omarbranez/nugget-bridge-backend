class TeamPokemon < ActiveRecord::Base
    has_one :ability
    has_one :gender
    has_one :nature
    has_one :item
    has_many :moves
    belongs_to :user
    belongs_to :pokemon
end