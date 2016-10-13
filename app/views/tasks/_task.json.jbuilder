json.extract! task, :id, :title, :comments, :status, :start_date, :due_date, :estimation, :created_at, :updated_at
json.url task_url(task, format: :json)