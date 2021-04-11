require_relative 'commands/generic'
require_relative 'service_result'
require_relative 'formatter'
# require_relative 'logger'

module CmsCli
  class DatabaseBackup
    class << self
      def perform(
        name,
        auth_db: 'admin',
        result: CmsCli::ServiceResult.new,
        dry_run: false,
        verbose: false
      )
        archive_filename = Commands::Generic.timestamp_file(name, ext: 'zip')
        connection_string = Formatter.atlas_connection_string(
          username: Settings[:atlas][:user],
          password: Settings[:atlas][:pass],
          auth_db: auth_db,
        )

        cmd = build_command(
          uri: connection_string,
          database: name,
          dest_file: archive_filename,
          verbose: verbose
        )

        if dry_run
          msg = 'Skipping command execution (dry run)'
          CmsCli.logger.debug :COMMAND, cmd
          CmsCli.logger.debug :ABORT, msg
          abort(msg)
        end

        # Run command
        result.complete! `#{cmd}`
      end

      def build_command(uri:, database:, dest_file:, verbose: false)
        # mongodump = `$(which mongodump)`
        mongodump = '/usr/local/bin/mongodump'

        cmd = <<~COMMAND
          #{mongodump} #{verbose ? '-v' : ''} --archive=/usr/share/#{dest_file} \
            --db=#{database} \
            --uri=#{uri}
        COMMAND

        cmd
      end
    end
  end
end
