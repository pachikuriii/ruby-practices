# frozen_string_literal: true

class Frame
  def initialize(shots)
    @frames = shots
  end

  def make_frames
    @frames.each_slice(2).to_a
  end
end
