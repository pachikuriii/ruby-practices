# frozen_string_literal: true

require_relative 'shot'
require_relative 'frame'
require_relative 'game'

def main
  shots = ARGV[0]
  shots = Shot.new(shots).convert_to_num_if_strike?
  frame = Frame.new(shots).make_frames
  game = Game.new(frame)
  puts game.calc_total_score
end

main
