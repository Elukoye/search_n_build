class Api::V1::AppointmentsController < ApplicationController
    before_action :find_appointment, only:[:show,:update,:destroy]
    
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
            render json:{error: @appointment.errors.full_messages},status: 400
        end
    end

    def update
        @appointment = Appointment.update(appointment_params)
        if @appointment.save
            render json: {message:"Date Updated Successfully"}, status: 200
        else
            render json:{error:"An error occurred,Date not created"},status: 400
        end
    end

    def destroy
        if @appointment
            @appointment.destroy
            render json:{message:"Date successfully destroyed"}
        else
            render json:{error:"An error occurred,Date not created"},status: 400
        end
    end

    private
    def find_appointment
        @appointment = Appointment.find(params[:id])
    end

    def appointment_params
        params.require(:appointment).permit(:date,:user_id,:project_id)
    end
end
