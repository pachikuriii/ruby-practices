# frozen_string_literal: true

class Frame
  def initialize(shots)
    @first_shot = shots[0]
    @second_shot = shots[1]
  end

  def strike?
    @first_shot.convert_to_num == 10
  end

  def spare?
    @first_shot.convert_to_num + @second_shot.convert_to_num == 10
  end

  def first_shot_score
    @first_shot.convert_to_num
  end

  def total_score
    @first_shot.convert_to_num + @second_shot.convert_to_num
  end
end
