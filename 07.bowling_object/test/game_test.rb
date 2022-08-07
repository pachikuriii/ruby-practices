# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../shot'
require_relative '../frame'
require_relative '../game'

class GameTest < Minitest::Test
  def setup
    frame1 = Frame.new([Shot.new('0'), Shot.new('10')]) # spare
    frame2 = Frame.new([Shot.new('1'), Shot.new('5')]) # other
    frame3 = Frame.new([Shot.new('0'), Shot.new('0')]) # other
    frame4 = Frame.new([Shot.new('0'), Shot.new('0')]) # other
    frame5 = Frame.new([Shot.new('10'), Shot.new('0')]) # strike
    frame6 = Frame.new([Shot.new('10'), Shot.new('0')]) # strike
    frame7 = Frame.new([Shot.new('10'), Shot.new('0')]) # strike
    frame8 = Frame.new([Shot.new('5'), Shot.new('1')]) # other
    frame9 = Frame.new([Shot.new('8'), Shot.new('1')]) # other
    frame10 = Frame.new([Shot.new('0'), Shot.new('4')]) # other
    frames = [frame1, frame2, frame3, frame4, frame5, frame6, frame7, frame8, frame9, frame10]
    @game = Game.new(frames)
  end

  def test_calc_total_score
    assert @game.calc_total_score, 107
  end
end
