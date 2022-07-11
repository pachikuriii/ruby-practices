# frozen_string_literal: true

class Shot
  def initialize(shots)
    @shots = shots.split(',')
  end

  def convert_to_num_if_strike?
    shots = []
    @shots.each do |shot|
      if shot == 'X'
        shots << 10
        shots << 0
      else
        shots << shot.to_i
      end
    end
    shots
  end
end
