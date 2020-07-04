# frozen_string_literal: true

class Api::V1::SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, time: time }, status: :ok
    else
      render json:
       { error: 'username or password not found' },
             status: :unauthorized
    end
  end
end
