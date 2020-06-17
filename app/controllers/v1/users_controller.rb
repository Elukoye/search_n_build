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
        @user = User.create(user_params)
        if @user.save
            render json: @user, status: :created
        else 
            render json: {error: @user.errors.full_messages}, status: 400
        end
    end

    def update
        if @user
            user.update(user_params)
            render json:{message:"Update was successful"}, status: 200
        else
            render json: {error:"An error occured,Update not successful"}, status: 400
        end
    end

    def destroy
        if @user 
            @user.destroy
            render json:{message: "User was successfully destroyed"}, status: 200
        else
            render json:{error: "An error occured,User not destroyed"}, status: 400
        end
    end



   private
   def user_params
    params.require(:user).permit(:username,:password,:password_digest)
   end

   def find_user
    @user = User.find(params[:id])
   end
end
