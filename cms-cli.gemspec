require 'fileutils'

$LOAD_PATH.unshift File.expand_path '../lib', __FILE__

version = `bin/current_version`

Gem::Specification.new do |spec|
  spec.name                  = 'cms-cli'.freeze
  spec.version               = version
  spec.required_ruby_version = '>= 2.6'
  # s.license               = 'UNLICENSED'
  # s.date                  = Time.now.strftime('%Y-%m-%d')
  spec.summary               = 'LarCity (Strapi) CLI Tools. Written in Ruby.'
  # @Todo update the homepage for the LarCity CMS CLI
  # spec.homepage              = "https://github.com/LarCity/apps/tree/master/packages/cms/cli"
  spec.email                 = 'uche@lar.city'.freeze
  spec.authors               = ['Uche Chilaka'.freeze]
  spec.require_paths         = ['lib'.freeze]
  # s.files                 = %w(README.md Rakefile LICENSE)
  # spec.files                  = %w(README.md)
  spec.files                 += Dir.glob('lib/**/*')
  spec.files                 += Dir.glob('bin/**/*')
  # s.files                 += Dir.glob("man/**/*")
  # s.files                 += Dir.glob("test/**/*")
  spec.executables = %w(cms-cli)
  spec.description = <<~desc
    A CLI tool for managing LarCity's (Strapi) CMS project
  desc
end
