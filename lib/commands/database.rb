require 'thor'
require_relative '../formatter'
require_relative '../database_backup'
require_relative 'generic'
require_relative '../command_result'

module CmsCli::Commands
  class Database < CmsCli::CommandResult
    desc 'backup', 'Download a backup of the CMS database'
    option :auth_db, aliases: [:a], banner: 'Authentication database'
    option :name, aliases: [:n], banner: 'Database to backup'
    option :verbose, type: :boolean, aliases: [:v],
           banner: 'Output debug logs'
    option :dry_run, type: :boolean, aliases: [:noop],
           banner: 'Run this command without writing any changes to disk'
    def backup
      auth_db, verbose, dry_run = options.values_at(
        :auth_db,
        :verbose,
        :dry_run
      )

      fail!('Authentication database not defined') if auth_db.blank?

      if_success do
        fail!('Database name not defined') if name.blank?

        if_success do
          # @Todo output the connection string (see "bin/larcity-cli-beta atlas connect" command in cli-tools)

          CmsCli::DatabaseBackup.perform(
            options[:name],
            auth_db: auth_db,
            dry_run: dry_run,
            verbose: verbose,
          )
        end
      end
    end
  end
end
