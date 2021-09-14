class User < ActiveRecord::Base
    has_many :team_pokemons
    has_many :pokemon, through: :team_pokemons

    after_create :set_initial_states
    after_create :generate_new_team
    after_update :set_team_size
    after_update :seed_opponent

    
    def set_initial_states
        self.update(victories: 0, active: true, team_size: 0)
        
        self.save
    end
    
    def generate_new_team
        6.times do
            TeamPokemon.create!(user_id: self.id, pokemon_id: Pokemon.order(Arel.sql('RANDOM()')).first.id)
        end
    end
    
    def set_team_size
        if self.team_size < self.team_pokemons.count
            self.update(team_size: self.team_pokemons.count)
        end
    end
    
    def seed_opponent
        if User.last.user_type == "player"
            User.create(name: Faker::Name.first_name, user_type: "cpu")
        end
    end

    def check_team_size
        self.team_size
    end


end