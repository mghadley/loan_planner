json.extract! budget, :id, :amount, :created_at, :updated_at
json.url budget_url(budget, format: :json)