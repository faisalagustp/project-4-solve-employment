json.extract! review, :id, :rating, :review, :employer_id, :employee_id, :review_for, :created_at, :updated_at
json.url review_url(review, format: :json)
