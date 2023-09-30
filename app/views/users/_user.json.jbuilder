json.extract! user, :id, :indentificationNumber, :startDate, :endDate, :name, :email, :mainNumber, :optNumber, :person_type_id, :created_at, :updated_at
json.url user_url(user, format: :json)
