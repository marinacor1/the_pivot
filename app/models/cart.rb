class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total
    contents.keys.count
  end

  def add_reservation(reservation_data)
    home_id = reservation_data.keys.pop
    contents[home_id] = reservation_data[home_id]
  end

  def remove_reservation(reservation_id)
    contents.delete(reservation_id.to_s)
  end

  def reservations
    self.contents
  end

  def has_reservation?(reservation_id)
    contents.has_key?(reservation_id.to_s)
  end

end
