# frozen_string_literal: true

require 'etc'
require 'optparse'

require_relative 'file'
require_relative 'stat'
require_relative 'display'

def main
  params = ARGV.getopts('alr')
  all_files = get_all_files(params).map { |file| File.new(file) }
  stats = all_files.map { |file| Stat.new(file.instance_variable_get(:@file)) }
  if params['l']
    Display.new(stats).l_option
  else
    Display.new(stats).other_options
  end
end

def get_all_files(params)
  files = params['a'] ? Dir.glob('*', File::FNM_DOTMATCH).sort : Dir.glob('*').sort
  files = files.reverse if params['r']
  files
end

main
