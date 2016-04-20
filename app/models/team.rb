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
      new_contents[coder] = 1 unless coder == coder_id
    end
    @contents = new_contents
  end
end

