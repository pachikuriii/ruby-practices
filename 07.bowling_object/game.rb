# frozen_string_literal: true

class Game
  FULL_MARKS = 10
  FRAMES_TOTAL_NUM = 10

  def initialize(frames)
    @frames = frames
  end

  def calc_total_score
    @frames.first(FRAMES_TOTAL_NUM).each_with_index.sum do |frame, index|
      next_frame = @frames[index + 1]
      after_the_next_frame = @frames[index + 2]
      if frame.strike?
        calc_strike_shot(next_frame, after_the_next_frame)
      elsif frame.spare?
        calc_spare_shot(next_frame)
      else
        frame.total_score
      end
    end
  end

  private

  def calc_strike_shot(next_frame, after_the_next_frame)
    score = 0
    score += after_the_next_frame.first_shot_score if next_frame.strike?
    score + FULL_MARKS + next_frame.total_score
  end

  def calc_spare_shot(next_frame)
    FULL_MARKS + next_frame.first_shot_score
  end
end
