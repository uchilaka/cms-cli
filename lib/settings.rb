require 'config'

CONFIG_ROOT = File.expand_path('../../config', __FILE__)

# Setup configurations: https://github.com/rubyconfig/config#installing-on-other-ruby-projects
Config.load_and_set_settings(
  Config.setting_files(
    CONFIG_ROOT,
    ENV['NODE_ENV'] || 'development'
  )
)
