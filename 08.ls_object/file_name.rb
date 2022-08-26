# frozen_string_literal: true

require_relative 'stat'
class FileName
  ROW_NUM = 3
  ROW_MAX_WIDTH = 24
  def initialize(stats)
    @stats = stats
  end

  def show
    transpose_line_column.each do |column|
      puts column.join
    end
  end

  private

  def transpose_line_column
    files = @stats.map { |stat| " #{stat.file_name}" }
    files.push(' ') while files.length % ROW_NUM != 0
    column_num = files.length / ROW_NUM
    transposed_files = files.each_slice(column_num).to_a.transpose
    transposed_files.first(column_num).each do |column|
      ROW_NUM.times do |index|
        column[index] += ' ' * (ROW_MAX_WIDTH - column[index].length)
      end
    end
  end
end
