json.extract! job_application, :id, :coverletter, :job_id, :employee_id, :created_at, :updated_at
json.url job_application_url(job_application, format: :json)
