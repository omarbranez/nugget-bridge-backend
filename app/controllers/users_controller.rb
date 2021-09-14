class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def show
        user = User.find_by(id: params[:id])
        options = {
            include: [:team_pokemons]
        }
        render json: UserSerializer.new(user, options)
    end

    def create
        user = User.find_or_create_by(user_params)
        render json: UserSerializer.new(user)
    end

    def update
        user = User.find_by(params[:id])
        user.update(user_params)
        render json: UserSerializer.new(user)
    end

    private

    def user_params
        params.permit(:name, :victories)
    end
end