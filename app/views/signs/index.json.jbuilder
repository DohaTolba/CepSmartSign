json.array!(@signs) do |sign|
  json.extract! sign, :id, :employee_id, :date, :check_in, :check_out
  json.url sign_url(sign, format: :json)
end
