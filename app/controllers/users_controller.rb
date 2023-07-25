class UsersController < ApplicationController
    def index 
        render json: User.all
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
          render json: user
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
      end

    def create 
        begin 
        user = User.create!(user_params)
        user.valid?
            session[:user_id] = user.id 
            render json: user, status: :created
        rescue ActiveRecord::RecordInvalid => invalid 
            render json: {errors: invalid.record.full_messages}, status: :unprocessable_entity
        end
    end

    private 
    def user_params
        params.permit(:username, :age, :gender, :password, :password_confirmation)
    end
end
