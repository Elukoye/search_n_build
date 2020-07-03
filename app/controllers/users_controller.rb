# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      token = JsonWebToken.encode(user_id: new_user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, time: time }, status: :ok
    else
      head(:unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
