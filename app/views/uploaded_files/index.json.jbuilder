json.array!(@uploaded_files) do |uploaded_file|
  json.extract! uploaded_file, 
  json.url uploaded_file_url(uploaded_file, format: :json)
end