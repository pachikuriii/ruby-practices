# frozen_string_literal: true

STRIKE = 10
SPARE = 10
class Frame
  def initialize(shots)
    @first_shot = shots[0]
    @second_shot = shots[1]
  end

  def strike?
    @first_shot.score == STRIKE
  end

  def spare?
    @first_shot.score + @second_shot.score == SPARE
  end

  def first_shot_score
    @first_shot.score
  end

  def total_score
    @first_shot.score + @second_shot.score
  end
end
