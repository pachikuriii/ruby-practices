# frozen_string_literal: true

require_relative 'shot'
require_relative 'frame'
require_relative 'game'

def main
  shots = []
  ARGV[0].split(',').each do |num|
    if num == 'X'
      shots << Shot.new('X')
      shots << Shot.new(0)
    else
      shots << Shot.new(num)
    end
  end

  frames = shots.each_slice(2).to_a.map { |shot_array| Frame.new(shot_array) }
  game = Game.new(frames)
  puts game.calc_total_score
end

main
