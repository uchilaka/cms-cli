require 'larcity/commands/command_support'

module CmsCli::Commands
  class Generic < LarCity::Commands::CommandSupport
    def self.timestamp_file(file_name, ext:)
      # noinspection SpellCheckingInspection
      "#{file_name}__#{CmsCli::Formatter.file_stamp}#{ext ? ".#{ext}" : ""}"
    end
  end
end
