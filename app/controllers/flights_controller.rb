class FlightsController < ApplicationController

    def index
        @flight = Flight.new()
        @airport_options = Airport.all.map { |a| a.code }
        @date_options = Flight.all.map { |f| f.start.strftime("%m/%d/%Y") }
        @passenger_options = [1, 2, 3, 4]
        @passengers = 1

        if params[:date].present?
            selected_date = Date.new(params[:date]['date_pieces(1i)'].to_i, params[:date]['date_pieces(2i)'].to_i, params[:date]['date_pieces(3i)'].to_i)
            @flights = Flight.where(start: selected_date.beginning_of_day..selected_date.end_of_day)
            @passengers = params[:passengers]
        else
            @flights = Flight.all
        end

        if params[:flight].present?
            redirect_to new_booking_path(flight: params[:flight], passengers: params[:passengers])
        end
    end
end

