json.array!(@employees) do |employee|
  json.extract! employee, :id, :first_name, :last_name, :pay_rate
  json.url employee_url(employee, format: :json)
end
