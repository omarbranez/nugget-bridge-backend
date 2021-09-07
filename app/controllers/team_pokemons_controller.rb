class TeamPokemonsController < ApplicationController
    def index
        team_pokemons = TeamPokemon.all
        render json: TeamPokemonSerializer.new(team_pokemons)
    end

    def show
        team_pokemon = TeamPokemon.where(user_id: params[:id])
        render json: TeamPokemonSerializer.new(team_pokemon).serializable_hash_to_json
    end
end