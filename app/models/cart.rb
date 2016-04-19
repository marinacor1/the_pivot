class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_item(item_id)
    contents[item_id.to_s] ||= 0
    contents[item_id.to_s] += 1
  end

  def total
    contents.values.sum
  end
end

  # attr_reader :contents
  # def initialize(initial_contents)
  #   @contents = initial_contents || {}
  # end
  # def add_pokemon(pokemon_id)
  #   contents[pokemon_id.to_s] ||= 0
  #   contents[pokemon_id.to_s] += 1
  # end
  # def total
  #   contents.values.sum
  # end
  # def count_of(pokemon_id)
  #   contents[pokemon_id.to_s] ? contents[pokemon_id.to_s] : 0
  # end
