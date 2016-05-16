class ReservationsController < ApplicationController

  def pending
    invalid_dates = Reservation.where(pending: false)

    invalid_dates = [
      '06-02-2016',
      '06-03-2016',
      '06-04-2016',
      '06-05-2016',
      '06-10-2016',
      '06-11-2016'
    ]

    respond_to do |format|
      format.html
      format.json {render json: invalid_dates }
    end

  end

end
