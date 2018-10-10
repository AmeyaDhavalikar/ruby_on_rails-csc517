json.extract! house, :id, :location, :address, :house_owner, :price, :year_built, :floors, :basement, :style, :square_footage, :created_at, :updated_at
json.url house_url(house, format: :json)
