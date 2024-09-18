class Passenger < ApplicationRecord
    belongs_to :booking, class_name: "Booking", foreign_key: "booking_id", inverse_of: :passengers 
end
