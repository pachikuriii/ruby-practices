# frozen_string_literal: true

class Frame
  def initialize(shots)
    @first_shot = shots[0]
    @second_shot = shots[1]
  end

  def strike?
    @first_shot.score == Game::FULL_MARKS
  end

  def spare?
    @first_shot.score + @second_shot.score == Game::FULL_MARKS
  end

  def first_shot_score
    @first_shot.score
  end

  def total_score
    @first_shot.score + @second_shot.score
  end
end
