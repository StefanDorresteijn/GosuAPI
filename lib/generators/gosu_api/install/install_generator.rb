module GosuApi
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def self.source_root
        @source_root ||= File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
      end

      def copy_initializer
        copy_file 'gosu_api.rb', 'config/initializers/gosu_api.rb'
      end

    end
  end
end