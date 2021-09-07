class UsersController < ApplicationController

    def show
        user = User.find_by(id: params[:id])
        render json: UserSerializer.new(user)
    end

    def new

    end

    def create
        user = User.create(user_params)
        render json: UserSerializer.new(user)
    end

    private

    def user_params
        params.require(:user).permit(:name, :password)
    end
end