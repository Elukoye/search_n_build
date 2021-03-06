# frozen_string_literal: true

class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.save
      token = JsonWebToken.encode(user_id: @new_user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, time: time }, status: 201
    else
      render json: { error: @new_user.errors.full_messages }, status: 400
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
