class PassengerMailer < ApplicationMailer
    default from: 'confirmations@example.com'

    def confirmation_email
        @booking = params[:booking]
        @passenger = params[:passenger]
        @flight = Flight.find(@booking.flight_id)
        mail(to:@passenger.email, subject: 'Booking confirmation')
    end
end
