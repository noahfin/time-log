json.extract! day_log, :id, :day, :time_in, :time_out, :created_at, :updated_at
json.url day_log_url(day_log, format: :json)