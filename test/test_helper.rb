require_relative '../lib/core_extensions'
# noinspection SpellCheckingInspection
require 'matahari'
require 'minitest/autorun'
require 'rubygems'
require 'bundler/setup'
# require_relative '../lib/logger'
require_relative 'mock_logger'
require_relative '../lib/settings'

class Minitest::Unit::TestCase
  # noinspection SpellCheckingInspection
  include Matahari::Adapters::TestUnit
end

class Minitest::Test
  # noinspection SpellCheckingInspection
  include Matahari::Adapters::TestUnit
end
