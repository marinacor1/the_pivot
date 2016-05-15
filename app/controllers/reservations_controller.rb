class ReservationsController < ApplicationController

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.valid? # && @reservation.has_no_conflicts?
      flash[:notice] = "Booking added to Trip!"

      Day.book(@reservation)

      redirect_to add_cart_path(@reservation.id)
    else
      flash[:notice] = "Those days are already booked! Contact the Host for more detail!"
      redirect_to request.referrer
    end
  end

  private

    def initial_strong_params
      params.require(:reservation).permit("home_id", "dates")
    end

    def reservation_params
      # need to refactor
      raw_dates = initial_strong_params[:dates].split(" - ")
      dates     = raw_dates.map { |date| date_formatter(date) }
      {home_id: initial_strong_params[:home_id], "check_in" => dates[0], "check_out" => dates[1]}
    end

    def date_formatter(date)
      Date.strptime(date, "%m/%d/%Y")
    end

end
