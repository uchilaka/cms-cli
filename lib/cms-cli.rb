require_relative 'core_extensions'
require 'fileutils'
require 'rubygems'
require 'bundler/setup'

# Require all the deps in my gemfile
Bundler.require

require 'larcity-cli-beta/cli_command_support'
# Require utils
require_relative 'logger'
require_relative 'formatter'
require_relative 'settings'
