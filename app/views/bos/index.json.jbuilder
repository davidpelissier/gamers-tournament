json.array!(@bos) do |bo|
  json.extract! bo, :id, :name, :phase
  json.url bo_url(bo, format: :json)
end
