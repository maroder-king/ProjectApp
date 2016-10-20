class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :change]

  # GET /tasks
  # GET /tasks.json
  def index
    @to_do = current_user.tasks.where(status: 'to_do')
    @doing = current_user.tasks.where(status: 'doing')
    @done = current_user.tasks.where(status: 'done')

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task.estimation = @task.due_date - @task.start_date
  end

  # GET /tasks/new
  def new
    @task = current_user.tasks.build

  end

  # GET /tasks/1/edit
  def edit

  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    @task.estimation = @task.due_date - @task.start_date
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
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
    @task.estimation = @task.due_date - @task.start_date
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
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
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change
    @task.estimation = @task.due_date - @task.start_date
    @task.update_attributes(status: params[:status])
    respond_to do |format|
      format.html { redirect_to tasks_path, notice: 'Task status successfully changed' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :content, :comments, :status, :start_date, :due_date, :estimation)
    end
end
