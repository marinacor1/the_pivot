class Team
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_coder(coder_id)
    contents[coder_id.to_s] ||= 0
    contents[coder_id.to_s] += 1
  end

  def total
    contents.values.sum
  end
end

