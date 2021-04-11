require 'minitest/mock'

# Minitest mocking documentation: https://github.com/seattlerb/minitest#label-Mocks
module CmsCli
  def self.logger
    MockLogger.new
  end

  class MockLogger
    def debug(*args)
      puts "To #{__method__} => #{args}"
    end

    def error(*args)
      puts "To #{__method__} => #{args}"
    end

    def info(*args)
      puts "To #{__method__} => #{args}"
    end
  end
end
