# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../shot'

class ShotTest < Minitest::Test
  def test_score
    assert_equal Shot.new('X').score, 10
    assert_equal Shot.new('2').score, 2
    assert_equal Shot.new('0').score, 0
  end
end
