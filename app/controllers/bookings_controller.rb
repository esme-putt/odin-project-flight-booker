class BookingsController < ApplicationController
    def new
        @flight_id = params[:flight]
        @flight = Flight.find(@flight_id)
        @passenger_count = params[:passengers]

        @booking = Booking.new
        @passenger_count.to_i.times do 
            @booking.passengers.build
        end
    end

    def show
        @booking = Booking.find(params[:id])
    end

    def create
        @booking = Booking.new(booking_params)

        if @booking.save 
            @booking.passengers.each do |passenger|
                PassengerMailer.with(booking: @booking, passenger: passenger).confirmation_email.deliver_now! 
            end
            redirect_to @booking      
        else
            # Log errors to console
            Rails.logger.info @booking.errors.full_messages
        end
    end

    private
    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:name, :email])
    end
end
