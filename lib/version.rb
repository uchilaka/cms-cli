# require 'larcity-cli'
# require_relative 'cms-cli'
require 'fileutils'
require 'json'

module CmsCli
  class Version
    class << self
      def current_version
        JSON.parse(File.read(default_config))['version']
      end

      def valid_config?(file_name)
        /package\.json$/ =~ file_name && File.exist?(file_name)
      end

      def default_config
        File.join(
          File.expand_path('..', __dir__),
          'package.json'
        )
      end
    end

    # CmsCli::Version::MAJOR, CmsCli::VERSION::MINOR etc.
    MAJOR, MINOR, BUILD, *OTHER = current_version.split '.'

    # CmsCli::Version::NUMBERS
    NUMBERS = [MAJOR, MINOR, BUILD, *OTHER]
  end

  VERSION = Version.current_version
end
