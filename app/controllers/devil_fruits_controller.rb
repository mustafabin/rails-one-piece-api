class DevilFruitsController < ApplicationController
  before_action :set_devil_fruit, only: %i[ show update destroy ]

  # GET /devil_fruits
  def index
    @devil_fruits = DevilFruit.all

    render json: @devil_fruits
  end

  # GET /devil_fruits/1
  def show
    render json: @devil_fruit
  end

  # POST /devil_fruits
  def create

    if session[:user_id]
      @devil_fruit = DevilFruit.new(name: params[:name],df_type: params[:df_type], user_id:session[:user_id])
      if @devil_fruit.save
        render json:  User.find(session[:user_id]), except: [:password_digest, :created_at, :updated_at], methods: [:devil_fruits]
      else
        render json: @devil_fruit.errors, status: :unprocessable_entity
      end
 
    else
      render json: {message:"Not logged in"}
    end
  end

  # PATCH/PUT /devil_fruits/1
  def update
    if @devil_fruit.update(devil_fruit_params)
      render json: @devil_fruit
    else
      render json: @devil_fruit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /devil_fruits/1
  def destroy
    @devil_fruit.destroy
  end

  def testing 
    render json: {message:"NOICE"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_devil_fruit
      @devil_fruit = DevilFruit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def devil_fruit_params
      params.require(:devil_fruit).permit(:name, :df_type)
    end
end
