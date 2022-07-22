# frozen_string_literal: true

require_relative 'shot'
require_relative 'frame'
require_relative 'game'

def main
  shots = []
  ARGV[0].split(',').each do |num|
    if num == 'X'
      shots << 'X'
      shots << 0
    else
      shots << num
    end
  end
  shots = shots.map { |shot| Shot.new(shot).convert_to_num_if_strike? }
  frames = shots.each_slice(2).to_a.each { |shot| Frame.new(shot) }
  game = Game.new(frames)
  puts game.calc_total_score
end

main
