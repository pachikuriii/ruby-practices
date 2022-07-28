# frozen_string_literal: true

require 'minitest/autorun'
require_relative './shot'
require_relative './frame'
require_relative './game'

class ShotTest < Minitest::Test
  def setup
    @shot1 = 'X'
    @shot2 = '2'
    @shot3 = '0'
  end

  def test_convert_to_num
    shots = []
    "#{@shot1},#{@shot2},#{@shot3}".split(',').each do |num|
      if num == 'X'
        shots << Shot.new('10').convert_to_num
        shots << Shot.new('0').convert_to_num
      else
        shots << Shot.new(num).convert_to_num
      end
    end
    assert_equal [10, 0, 2, 0], shots
  end
end

class FrameTest < Minitest::Test
  def setup
    @frame1 = Frame.new([Shot.new('10'), Shot.new('0')]) # strike
    @frame2 = Frame.new([Shot.new('4'), Shot.new('6')]) # spare
    @frame3 = Frame.new([Shot.new('2'), Shot.new('5')]) # other
  end

  def test_strike?
    assert @frame1.strike?
  end

  def test_spare?
    assert @frame2.spare?
  end

  def test_first_shot_score
    assert_equal @frame2.first_shot_score, 4
  end

  def test_total_score
    assert_equal @frame3.total_score, 7
  end
end

class GameTest < Minitest::Test
  def setup
    @frame1 = Frame.new([Shot.new('0'), Shot.new('10')]) # spare
    @frame2 = Frame.new([Shot.new('1'), Shot.new('5')]) # other
    @frame3 = Frame.new([Shot.new('0'), Shot.new('0')]) # other
    @frame4 = Frame.new([Shot.new('0'), Shot.new('0')]) # other
    @frame5 = Frame.new([Shot.new('10'), Shot.new('0')]) # strike
    @frame6 = Frame.new([Shot.new('10'), Shot.new('0')]) # strike
    @frame7 = Frame.new([Shot.new('10'), Shot.new('0')]) # strike
    @frame8 = Frame.new([Shot.new('5'), Shot.new('1')]) # other
    @frame9 = Frame.new([Shot.new('8'), Shot.new('1')]) # other
    @frame10 = Frame.new([Shot.new('0'), Shot.new('4')]) # other
    @frames = [@frame1, @frame2, @frame3, @frame4, @frame5, @frame6, @frame7, @frame8, @frame9, @frame10]
    @game = Game.new(@frames)
  end

  def test_calc_total_score
    assert @game.calc_total_score, 107
  end
end
