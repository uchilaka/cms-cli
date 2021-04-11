require_relative '../test_helper'

module CmsCli::Commands
  class DataTest < Minitest::Test
    def command
      File.join(File.expand_path('../..', __dir__), 'bin', 'cms-cli')
    end

    def test_simple
      assert_equal 1, 1
    end

    def test_command_help_menu
      result = `#{command} database backup --database test_db --dry-run`
      CmsCli.logger.info result: result
    end
  end
end
