require 'date'

module CmsCli
  module Formatter
    class << self
      def basic_auth(username:, password:)
        "#{username}:#{password}"
      end

      def atlas_connection_string(username:, password:, auth_db:)
        basic_auth_str = basic_auth(username: username, password: password)

        "mongodb+srv://#{basic_auth_str}@cluster0.cghre.gcp.mongodb.net/?ssl=true&authSource=#{auth_db}"
      end

      def file_stamp
        DateTime.now.strftime('%Y%m%d.%H%M')
      end
    end
  end
end
