# frozen_string_literal: true

class Shot
  def initialize(shot)
    @shot = shot
  end

  def convert_to_num_if_strike?
    @shot = if @shot == 'X'
              10
            else
              @shot.to_i
            end
    @shot
  end
end
