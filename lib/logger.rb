require 'semantic_logger'

# Set the global default log level
SemanticLogger.default_level = :trace

# Log to a file, and use the colorized formatter
SemanticLogger.add_appender(file_name: 'development.log')

# Log to stdout
SemanticLogger.add_appender(io: $stdout, level: :trace, formatter: :color)

# @Todo replacing an existing ruby logger instance: https://logger.rocketjob.io/appenders.html#logger-log4r-etc

# @Todo output exception log level to Rollbar: https://logger.rocketjob.io/appenders.html#rollbar
# @Todo investigate posting logs to a central logging utility in GCP: https://logger.rocketjob.io/appenders.html#https

# Documentation for other appenders: https://logger.rocketjob.io/appenders.html

# @Todo get this to use SemanticLogger
module CmsCli
  include SemanticLogger::Loggable

  def self.logger
    SemanticLogger['CmsCli']
  end
end
