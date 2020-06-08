class V1::UsersController < ApplicationController
    before_action :find_user, only:[:show,:update,:destroy]
    def index
        @users = User.all 
        render json: @users, status: 200
    end

    def show
      render json: @user
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else 
            render json: {error:"an error occurred, user not created"}, status: 400
        end
    end

    def update
        if @user
            user.update(user_params)
        else
            render json: {error:"update was not successful"}, status: 400
        end
    end

    def destroy
        if @user 
            @user.destroy
            render json:{message: "User successfully destroyed"}, status: 200
        else
            render json:{error: "user was not destroyed"}, status: 400
        end
    end



   private
   def user_params
    params.require(:user).permit(:username,:password)
   end

   def find_user
    @user = User.find(params[:id])
   end
end
