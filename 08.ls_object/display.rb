# frozen_string_literal: true

require_relative 'file_info'
require_relative 'file_name'
class Display
  def initialize(stats, params)
    @stats = stats
    @params = params
  end

  def show
    if @params['l']
      FileInfo.new(@stats).show
    else
      FileName.new(@stats).show
    end
  end
end
