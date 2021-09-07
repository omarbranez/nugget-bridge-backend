class User < ActiveRecord::Base
    has_many :team_pokemons
    has_many :pokemon, through: :team_pokemons

    after_create :set_initial_states, :generate_new_team
    after_update :set_team_size, :check_team_size

    def set_team_size
        self.team_size = self.team_pokemons.count
    end
    
    def check_team_size
        self.team_size
    end

    def set_initial_states
        self.victories = 0
        self.active = true
    end

    def generate_new_team
        6.times do
            binding.pry
            TeamPokemon.create(user_id: self.id, pokemon_id: Pokemon.order(Arel.sql('RANDOM()')).first.id)
        end
    end
end