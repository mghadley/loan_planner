json.extract! loan, :id, :amount, :interest_rate, :interest_month, :created_at, :updated_at
json.url loan_url(loan, format: :json)