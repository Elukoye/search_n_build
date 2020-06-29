class Api::V1::ProjectsController < ApplicationController
    before_action :authorize_request

    def index
        projects = Project.all 
        render json: projects, status: :ok
    end

    def show
        project = Project.find(params[:id])
        render json: project, status: :ok
    end

    def create 
        project = Project.create(project_params)
        if project.save
            render json: project, status: :created
        else 
            render json: {error: project.errors.full_messages}, status: 400
        end
    end

    private 
    def project_params
        params.require(:project).permit(:title,:description,:hrs)
    end
end
