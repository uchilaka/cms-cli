require_relative 'serviceable'

module CmsCli
  class CommandResult < Thor
    include Serviceable
  end
end
