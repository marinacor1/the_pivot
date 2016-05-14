class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total
    contents.values.sum
  end

  def add_reservation(reservation_id)
    contents[reservation.to_s] = 1
  end

  def remove_reservation(reservation_id)
    contents.delete(reservation_id.to_s)
  end

  def reservations
    self.contents.map { |reservation_id, _quantity| Reservation.find(reservation_id) }
  end

  def has_reservation?(reservation_id)
    contents.has_key?(reservation_id.to_s)
  end

  def total_days
    # ActiveRecord
    # tasks.reduce(0) { |sum, task| sum += task.hours }
  end

end
