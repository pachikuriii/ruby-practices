# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../shot'
require_relative '../frame'

class FrameTest < Minitest::Test
  def setup
    @frame1 = Frame.new([Shot.new('10'), Shot.new('0')]) # strike
    @frame2 = Frame.new([Shot.new('4'), Shot.new('6')]) # spare
    @frame3 = Frame.new([Shot.new('2'), Shot.new('5')]) # other
  end

  def test_strike?
    assert @frame1.strike?
    refute @frame2.strike?
  end

  def test_spare?
    assert @frame2.spare?
    refute @frame3.spare?
  end

  def test_first_shot_score
    assert_equal @frame2.first_shot_score, 4
  end

  def test_total_score
    assert_equal @frame3.total_score, 7
  end
end
