class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.text "flight_id"
      t.text "passenger_id"

      t.timestamps
    end
  end
end
