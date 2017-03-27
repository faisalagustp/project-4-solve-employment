json.extract! job, :id, :title, :description, :wage, :employer_id, :employee_id, :created_at, :updated_at
json.url job_url(job, format: :json)
