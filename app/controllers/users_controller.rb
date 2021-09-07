class UsersController < ApplicationController

    def show
        user = User.find_by(id: params[:id])
        render json: UserSerializer.new(user)
    end
end