json.extract! task, :id, :project_id, :owner_id, :start_at, :end_at, :status, :references, :comments, :created_at, :updated_at
json.url task_url(task, format: :json)
