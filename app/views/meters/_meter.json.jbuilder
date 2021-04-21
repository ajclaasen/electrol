json.extract! meter, :id, :name, :start, :finish, :interval, :unit, :created_at, :updated_at
json.measurements meter.measurements, :amount
json.url meter_url(meter, format: :json)
