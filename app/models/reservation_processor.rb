class ReservationProcessor

  def initialize(cart, user)
    @cart = cart
    @user = user
  end

  def create_trip
    reservations = process_cart
    trip = Trip.create(user_id: @user.id)
    trip.reservations << reservations
  end

  ## Create Individual Days
  # check_in.next until == check_out

  def process_cart
    reservations = create_reservations
    reservations.each do |reservation|
      require "pry"
      binding.pry
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

end
