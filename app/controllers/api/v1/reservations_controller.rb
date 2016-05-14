class Api::V1::ReservationsController < ApplicationController

  def create
    # model
    start_date = reservation_params[:startDate].to_date
    end_date   = reservation_params[:endDate].to_date
    total_days = (end_date - start_date).to_i
    home_id    = reservation_params[:homeId].to_i
    # user_id = current_user.id

    reservation = Reservation.new(
      home_id: home_id,
      check_in: start_date,
      check_out: end_date
      )

    reservation.days << Day.where(date: start_date..end_date)

    if reservation.valid? && reservation.has_no_conflicts?
      reservation.save
    end
  end

  private

  def reservation_params
    params.require(:data).permit("startDate", "endDate", "homeId")
  end
end
