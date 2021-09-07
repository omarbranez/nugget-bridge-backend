class TeamPokemon < ActiveRecord::Base
    # has_one :ability
    # has_one :gender
    # has_one :nature
    # has_one :item
    # has_many :moves
    # has_many :pokemon
    belongs_to :user
    belongs_to :pokemon
    
    effort_attribute_array = ["effort_hp", "effort_attack", "effort_defense", "effort_special_attack", "effort_special_defense", "effort_speed"]
    # @team = []
    def new_team_pokemon
        Pokemon.order(Arel.sql('RANDOM()')).first.id
    end

    def generate_new_team
        if current_user.pokemon.count == 0
            6.times do
                TeamPokemon.create(user_id: current_user.id, pokemon_id: new_team_pokemon)
            end
        end
    end
    
    def replace_team_pokemon
        until current_user.pokemon.count == 6
            TeamPokemon.create(user_id: current_user.id, pokemon_id: new_team_pokemon)
        end
    end

    def generate_random_ivs
        # steps = [1,2,3,4,5,6]
        iv_values = []
        # steps.each do |step|
        6.times do
            iv_values.push(rand(0..(32)))
        end
        iv_values
    end
    
    def generate_random_evs
        steps = [1,2,3,4,5,6]
        maxEVs = 510
        ev_values= []
        steps.each do |step|
            if step < 6
                if maxEVs < 256
                    evValue = rand(0..(maxEVs))
                else
                    evValue = rand(256)
                end
            else
                evValue = maxEVs
            end
            maxEVs = maxEVs - evValue
            ev_values.push(evValue)
        end
        ev_values
    end
    def self.generate_moves
        # self.move_1

    end
end