# frozen_string_literal: true

class Game
  def initialize(frames)
    @frames = frames
  end

  def calc_total_score
    @frames.first(10).each_with_index.sum do |frame, index|
      next_frame = @frames[index + 1]
      after_the_next_frame = @frames[index + 2]
      if frame[0] == 10
        calc_strike_shot(next_frame, after_the_next_frame)
      elsif frame.sum == 10
        calc_spare_shot(next_frame)
      else
        frame.sum
      end
    end
  end

  def calc_strike_shot(next_frame, after_the_next_frame)
    score = 0
    score += after_the_next_frame[0] if next_frame[0] == 10
    score + 10 + next_frame.sum
  end

  def calc_spare_shot(next_frame)
    10 + next_frame[0]
  end
end
