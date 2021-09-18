class TeamPokemonsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        team_pokemons = TeamPokemon.all
        render json: TeamPokemonSerializer.new(team_pokemons)
    end

    def show
        team_pokemon = TeamPokemon.find_by(id: params[:id])
        options = {
            include: [:user]
        }
        render json: TeamPokemonSerializer.new(team_pokemon, options).serializable_hash.to_json
    end

    def update
        # binding.pry
        team_pokemon = TeamPokemon.find_by(id: params[:id])
        team_pokemon.update(team_pokemon_params)
        if team_pokemon#maybe user can accept nested attributes for teampokemons
            render json: TeamPokemonSerializer.new(team_pokemon)
        end
    end

    private

    def team_pokemon_params
        params.permit(:id, :current_status, :current_hp, :position)
    end
end