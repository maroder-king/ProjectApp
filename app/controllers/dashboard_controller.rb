class DashboardController < ApplicationController
  def index
    if current_user
      @tasks_active = current_user.tasks.where(status: 'to_do').count + current_user.tasks.where(status: 'doing').count
      @tasks_done = current_user.tasks.where(status: 'done').count
      @posts = current_user.posts.count
      @projects = current_user.projects.count
    end

  end
end
