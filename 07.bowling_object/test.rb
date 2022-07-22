# frozen_string_literal: true

require 'minitest/autorun'
require_relative './shot'
require_relative './frame'
require_relative './game'

class ShotTest < Minitest::Test
  def test_shot
    shots = []
    ARGV[0].split(',').each do |num|
      if num == 'X'
        shots << 'X'
        shots << 0
      else
        shots << num
      end
    end

    shots = shots.map do |shot|
    shot = Shot.new(shot).convert_to_num_if_strike?
    end
 
  assert_equal [0, 10, 1, 5, 0, 0, 0, 0, 10, 0, 10, 0, 10, 0, 5, 1, 8,1, 0,4], shots
  end
end

class FrameTest < Minitest::Test
  def test_frame
    shots = []
    ARGV[0].split(',').each do |num|
      if num == 'X'
        shots << 'X'
        shots << 0
      else
        shots << num
      end
    end
    shots = shots.map {|shot| Shot.new(shot).convert_to_num_if_strike?}
    frames = shots.each_slice(2).to_a.each { |shots|Frame.new(shots)}
    assert_equal [[6, 3], [9, 0], [0, 3], [8, 2], [7, 3], [10, 0], [9, 1], [8, 0], [10, 0], [6, 4], [5]], frames
  end
end

class GameTest < Minitest::Test
  def test_game
    shots = []
    ARGV[0].split(',').each do |num|
      if num == 'X'
        shots << 'X'
        shots << 0
      else
        shots << num
      end
    end
    shots = shots.map {|shot| Shot.new(shot).convert_to_num_if_strike?}
    frames = shots.each_slice(2).to_a.each { |shots|Frame.new(shots)}
    game = Game.new(frames)
    assert_equal 107, game.calc_total_score
  end
end
