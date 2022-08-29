# frozen_string_literal: true

require 'etc'
require 'optparse'
require_relative 'stat'
require_relative 'file_info'
require_relative 'file_name'
def main
  params = ARGV.getopts('alr')
  all_files = get_all_files(params).map { |file| file }
  stats = all_files.map { |file| Stat.new(file) }
  display = params['l'] ? FileInfo.new(stats) : FileName.new(stats)
  display.show
end

def get_all_files(params)
  files = params['a'] ? Dir.glob('*', File::FNM_DOTMATCH).sort : Dir.glob('*').sort
  files = files.reverse if params['r']
  files
end

main
