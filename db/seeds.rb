# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create Airports
airport_1 = Airport.create(code: "WGN")
airport_2 = Airport.create(code: "AKL")
airport_3 = Airport.create(code: "DND")
airport_4 = Airport.create(code: "QTN")
airport_5 = Airport.create(code: "CHC")

# Create Flights
Flight.create(departure_id: airport_1.id, arrival_id: airport_2.id, start: DateTime.now + 1.day, duration: 300)
Flight.create(departure_id: airport_2.id, arrival_id: airport_3.id, start: DateTime.now + 2.days, duration: 240)
Flight.create(departure_id: airport_3.id, arrival_id: airport_4.id, start: DateTime.now + 3.days, duration: 180)
Flight.create(departure_id: airport_4.id, arrival_id: airport_5.id, start: DateTime.now + 4.days, duration: 210)
Flight.create(departure_id: airport_5.id, arrival_id: airport_1.id, start: DateTime.now + 5.days, duration: 260)