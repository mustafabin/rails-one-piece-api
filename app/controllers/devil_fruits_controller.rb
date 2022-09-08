class DevilFruitsController < ApplicationController
    def index
        fruits = DevilFruit.all.order("updated_at DESC")
        render json: fruits
    end
end