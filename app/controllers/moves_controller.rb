class MovesController < ApplicationController

    def show
        move = Move.find_by(id: params[:id])
        render json: MoveSerializer.new(move)
    end
end