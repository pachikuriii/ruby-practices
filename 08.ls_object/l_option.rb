# frozen_string_literal: true

class LOption
  def initialize(stats)
    @stats = stats
  end

  def show
    puts "total #{total_blocks}"
    file_mode.zip(link, name, group, size, month, day, time, file_name).each do |row|
      puts row.join
    end
  end

  private

  def file_mode
    @stats.map(&:file_mode)
  end

  def link
    adjust_blank(@stats.map(&:link), 2)
  end

  def name
    adjust_blank(@stats.map(&:name), 1)
  end

  def group
    adjust_blank(@stats.map(&:group), 2)
  end

  def size
    adjust_blank(@stats.map(&:size), 2)
  end

  def month
    adjust_blank(@stats.map(&:month), 2)
  end

  def day
    adjust_blank(@stats.map(&:day), 1)
  end

  def time
    adjust_blank(@stats.map(&:time), 0)
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
