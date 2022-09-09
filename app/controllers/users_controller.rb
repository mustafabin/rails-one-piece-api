class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users, except: [:password_digest]
  end

  # GET /users/1
  def show
    render json:  @user, except: [:password_digest, :created_at, :updated_at], methods: [:devil_fruits]
  end

  # POST /users
  def create
    @user = User.create!(user_params)
    if @user
      session[:user_id] = @user.id
      render json: @user, status: :created, location: @user, except: [:password]
    else
      render json: @user.errors, status: :unprocessable_entity
    end

  end
  def login 
    @user = User.find_by(email:user_params[:email]).try(:authenticate, user_params[:password])
    if @user
        session[:user_id] = @user.id
        render json: @user
    else
        render json: {message:"401 not authorized"}
      end
    end
    
  def logout 
    reset_session
    render json: {message:"Logged out"}
   end
    
  def profile
    if session[:user_id]
      render json: User.find(session[:user_id]), except: [:password, :created_at, :updated_at], methods: [:devil_fruits]
    else
      render json: {message:"401 not authorized"}
    end
  
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.permit(:name, :email, :password, :password_confirmation, :qoute)
    end
end
