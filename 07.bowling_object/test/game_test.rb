# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../shot'
require_relative '../frame'
require_relative '../game'

class GameTest < Minitest::Test
  def setup
    frames = [
      Frame.new([Shot.new('0'), Shot.new('10')]), # spare
      Frame.new([Shot.new('1'), Shot.new('5')]), # other
      Frame.new([Shot.new('0'), Shot.new('0')]), # other
      Frame.new([Shot.new('0'), Shot.new('0')]), # other
      Frame.new([Shot.new('10'), Shot.new('0')]), # strike
      Frame.new([Shot.new('10'), Shot.new('0')]), # strike
      Frame.new([Shot.new('10'), Shot.new('0')]), # strike
      Frame.new([Shot.new('5'), Shot.new('1')]), # other
      Frame.new([Shot.new('8'), Shot.new('1')]), # other
      Frame.new([Shot.new('0'), Shot.new('4')]) # other
    ]
    @game = Game.new(frames)
  end

  def test_calc_total_score
    assert @game.calc_total_score, 107
  end

  def test_calc_strike_shot
    next_frame = Frame.new([Shot.new('10'), Shot.new('0')])
    after_the_next_frame = Frame.new([Shot.new('5'), Shot.new('1')])
    assert_equal @game.send(:calc_strike_shot, next_frame, after_the_next_frame), 25
  end

  def test_calc_spare_shot
    next_frame = Frame.new([Shot.new('5'), Shot.new('1')])
    assert_equal @game.send(:calc_spare_shot, next_frame), 15
  end
end
