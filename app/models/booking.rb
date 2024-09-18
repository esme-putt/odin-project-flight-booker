class Booking < ApplicationRecord
    belongs_to :flight, class_name: "Flight", foreign_key: "flight_id", optional: true 
    has_many :passengers, class_name: "Passenger", foreign_key: "booking_id", inverse_of: :booking, dependent: :destroy

    accepts_nested_attributes_for :passengers
end