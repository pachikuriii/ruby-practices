# frozen_string_literal: true

class LOption
  def initialize(stats, params)
    @stats = stats
    @params = params
  end

  def show
    return unless @params['l']

    puts "total #{total_blocks}"
    file_mode.zip(link, name, group, size, month, day, time, file_name).each do |row|
      puts row.join
    end
  end

  private

  [
    ['link', 2],
    ['name', 1],
    ['group', 2],
    ['size', 2],
    ['month', 2],
    ['day', 1],
    ['time', 0]
  ].each do |type, space_num|
    define_method(type) do
      adjust_blank(@stats.map(&:"#{type}"), space_num)
    end
  end

  def file_mode
    @stats.map(&:file_mode)
  end

  def file_name
    @stats.map { |stat| " #{stat.file_name}" }
  end

  def total_blocks
    @stats.map(&:blocks).sum
  end

  def adjust_blank(stats, blank_size_num)
    max_length = stats.max.to_s.length
    stats.map do |stat|
      stat.to_s.rjust(max_length + blank_size_num, ' ')
    end
  end
end
