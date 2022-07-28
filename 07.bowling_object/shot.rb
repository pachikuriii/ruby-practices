# frozen_string_literal: true

class Shot
  def initialize(shot)
    @shot = shot
  end

  def convert_to_num
    if @shot == 'X'
      10
    else
      @shot.to_i
    end
  end
end
