# noinspection SpellCheckingInspection
require 'rake/testtask'
require_relative 'test/test_helper'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/**/test_*.rb', 'test/**/*_spec.rb']
end

desc 'Run tests'
task :default => :test
