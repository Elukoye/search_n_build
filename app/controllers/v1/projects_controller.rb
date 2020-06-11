class V1::ProjectsController < ApplicationController
    before_action :find_project, only:[:show,:update,:delete]

    def index
        @projects = Project.all 
        render json: @projects, status:200
    end

    def show
        render json: @project
    end

    def create 
        @project = Project.create(project_params)
        if @project.save
            render json: @project, status: :created
        else 
            render json: {error: @project.errors.full_messages}, status: 400
        end
    end

    def update 
        @project = Project.update(project_params)
        if @project.save
            render json: {message:"Project Updated Successfully"}, status: 200
        else
            render json: {error: "An error occured,Project not created"}, status: 400
        end
    end

    def destroy
        if @project
           @project.destroy
            render json: {message:" Project successfully destroyed"}
        else
            render json:{error: "An error occured,Project not destroyed"}
        end
    end

    private 
    def find_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require(:project).permit(:title,:description,:hrs)
    end
end
