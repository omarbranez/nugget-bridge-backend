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
        user = User.find_by(id: params[:id])
        user.update(user_params)
        render json: UserSerializer.new(user)
    end

    def login
        user = User.find_by(name: params[:name])
        if !!user
            render json: UserSerializer.new(user)
        end
    end
    private

    def user_params
        params.permit(:name, :victories, :user_type, :cpu)
    end
end