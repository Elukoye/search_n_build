class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_request, only: [:show,:create,:update,:destroy]
  before_action :find_project, only: %i[show update destroy]

  def index
    @projects = Project.all
    render json: @projects, status: :ok
  end

  def show
    render json: @project, status: :ok
  end

  def create
    @project = Project.create(project_params)
    if @project.save
      render json: @project, status: :created
    else
      render json: { error: @project.errors.full_messages }, status: 401
    end
  end

  def update
    if @project.update(project_params)
      render json: { message: 'Project Updated Successfully' }, status: 200
    else
      render json: { message: "Authentication is required"}, status: 401
    end
  end

  def destroy
    if @project
       @project.destroy
       head :no_content ,status: 200
    else
      render json: { message: "Authentication is required"}, status: 401
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :hrs)
  end

  def find_project
    @project = Project.find(params[:id])
  end
end
