# frozen_string_literal: true

class Api::V1::AppointmentsController < ApplicationController
  before_action :authorize_request, only: [:create]
  before_action :find_appointment, only: %i[show update destroy]

  def index
    @appointments = Appointment.all
    render json: @appointments, status: 200
  end

  def show
    render json: @appointment, status: 200
  end

  def create
    @appointment = Appointment.create(appointment_params)
    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: { error: @appointment.errors.full_messages }, status: 400
    end
  end

  def update
    if @appointment.update(appointment_params)
      render json: { message: 'Appointment Updated Successfully' }, status: 200
    else
      render json: { error: 'An error occurred,appointment not created' }, status: 400
    end
  end

  def destroy
    if @appointment
      @appointment.destroy
      render json: { message: 'Appointment successfully destroyed' }
    else
      render json: { error: 'An error occurred,appointment not destroyed' }, status: 400
    end
  end

  private

  def find_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:date, :user_id, :project_id)
  end
end
