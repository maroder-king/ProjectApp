class DashboardController < ApplicationController
  def index
    if current_user
      @tasks = (current_user.tasks).uniq.count
    end
  end
end
