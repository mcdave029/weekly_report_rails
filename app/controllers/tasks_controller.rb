# frozen_string_literal: true

# Controller for tasks query and mutations
class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.includes(:project).all
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show; end

  # GET /tasks/new
  def new
    @task = Task.new
    @project_options = Project.all.collect do |p|
      [p.name, p.id]
    end
    @statuses = Task::STATUSES
  end

  # GET /tasks/1/edit
  def edit
    @project_options = Project.all.collect do |p|
      [p.name, p.id]
    end
    @statuses = Task::STATUSES
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html do
          redirect_to @task,
                      notice: 'Task was successfully created.'
        end
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html do
          redirect_to @task,
                      notice: 'Task was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html do
        redirect_to tasks_url,
                    notice: 'Task was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task)
          .permit(:project_id, :start_at, :end_at, :status, :references,
                  :comments, :name)
  end
end
