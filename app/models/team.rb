class Team
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_coder(coder_id)
    contents[coder_id.to_s] ||= 0
    contents[coder_id.to_s] += 1
  end

  def remove_coder(coder_id)
    new_contents = {}
    contents.each do |coder, count|
      new_contents[coder] = 1 unless coder == coder_id.to_s
    end
    @contents = new_contents
  end

  def total_cost
    total = contents.reduce(0) do |sum, coder_id|
      sum += Coder.find(coder_id[0]).cost.to_f
      sum
    end
    sprintf("%.2f", total)
  end
end
