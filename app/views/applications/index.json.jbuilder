json.array!(@applications) do |application|
  json.extract! application, :id, :name, :email, :hometown, :website, :comment
  json.url application_url(application, format: :json)
end
