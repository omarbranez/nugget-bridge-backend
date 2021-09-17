class TeamPokemon < ActiveRecord::Base
    # has_one :ability
    # has_one :gender
    # has_one :nature
    # has_one :item
    # has_many :moves
    # has_many :pokemon
    belongs_to :user, required: false # fixes association issue
    belongs_to :pokemon, required: false
    belongs_to :type, required: false

    after_create :set_status_to_none
    after_create :generate_attributes
    after_create :set_hp_to_max

    # after_update :check_current_status # order is important # it's already posted
    after_update :check_current_hp

    def set_hp_to_max
        self.current_hp = calculate_hp_stat
    end

    def set_status_to_none
        self.current_status = "None"
    end

    def generate_attributes
        generate_move_set
        generate_random_evs
        generate_random_ivs
        self.current_hp = calculate_hp_stat # even though serializer uses it, we need to save it in upon initialization in backend
        self.save
    end


    def generate_move_set
        pokemon = Pokemon.find(self.pokemon_id)
        pokemon_moves = pokemon.move_list.split(", ").shuffle.take(4).map {|move_id| Move.find(move_id).id}
        self.move_1 = pokemon_moves[0]
        self.move_2 = pokemon_moves[1]
        self.move_3 = pokemon_moves[2]
        self.move_4 = pokemon_moves[3]
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
        self.effort_hp = ev_values[0]
        self.effort_attack = ev_values[1]
        self.effort_defense = ev_values[2]
        self.effort_special_attack = ev_values[3]
        self.effort_special_defense = ev_values[4]
        self.effort_speed = ev_values[5]
    end

    def generate_random_ivs
        iv_values = []
        6.times do
            iv_values.push(rand(0..(31)))
        end
        self.inherited_hp = iv_values[0]
        self.inherited_attack = iv_values[1]
        self.inherited_defense = iv_values[2]
        self.inherited_special_attack = iv_values[3]
        self.inherited_special_defense = iv_values[4]
        self.inherited_speed = iv_values[5]
    end

    def self.generate_new_team # for testing
        if User.second.pokemon.count == 0 # cpu player
            6.times do
                # binding.pry
                TeamPokemon.create(user_id: 2, pokemon_id: Pokemon.order(Arel.sql('RANDOM()')).first.id)
            end
        end
    end

    def possible_move_list(pokemon_id) # probably for pokemon model. but really for funsies
        pokemon = Pokemon.find(pokemon_id)
        pokemon.move_list.split(", ").each do |move|
            puts Move.find(move).name
        end
    end
   

    def self.team_generate_attributes
        TeamPokemon.where(user_id: 8).each do |pokemon|
            pokemon.generate_attributes
        end
    end

    def calculate_hp_stat
        level = 100 # all pokemon are level 100
        # binding.pry
        user = User.find(self.user_id)
        ((2 * user.pokemon.find(self.pokemon_id).base_hp + self.inherited_hp + (self.effort_hp / 4)) * level )/100 + level + 10
    end

    def calculate_stat(base_stat, iv_stat, ev_stat) #quotes, to use in send
        level = 100
        nature = 1 # not using natures yet
        user = User.find(self.user_id)
        (((((2 * user.pokemon.find(self.pokemon_id).send(base_stat) + self.send(iv_stat) + (self.send(ev_stat) / 4)) * level) / 100 ) + 5 ) * nature)
    end

    def parse_move(move_number)
        user = User.find(self.user_id)
        # movelist = [self.move_1, self.move_2, self.move_3, self.move_4]
        # movelist.map { |move| Move.find(move).name }
        Move.find(move_number).name
    end

    def check_current_hp
        # self.update(current_hp: params[:hp])
        if self.current_hp <= 0
            destroy_and_replace
        end
    end

    def destroy_and_replace
        user = User.find(self.user_id)
        self.destroy
        until user.team_pokemons.count == 6
            # binding.pry
            TeamPokemon.create(user_id: user.id, pokemon_id: Pokemon.order(Arel.sql('RANDOM()')).first.id)
        end
    end

    # def check_current_status
    #     self.update(current_status: params[:status])
    # end

    
end