class ReservationProcessor

  def initialize(cart, user)
    @cart = cart
    @user = user
  end

  def create_trip
    require "pry"
    binding.pry
    reservations = process_cart
    # trip = Trip.create
    # trip.reservations << reservations
  end

  def process_cart
    reservations = create_reservations
    reservations.each do |reservation|
      Day.book(reservation)
    end
  end

  def create_reservations
    @cart.each_pair.map do |home_id, data|
      reservation = Reservation.create(
        home_id:   home_id,
        user_id:   @user.id,
        check_in:  data['check_in'],
        check_out: data['check_out'],
      )
    end
  end

  # create Days

  # Book Days into Reservation

  # Add Days to invalid list

  # bundle Reservation(s) in Trip

end
