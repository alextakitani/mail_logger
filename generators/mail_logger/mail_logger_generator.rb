require File.expand_path(File.dirname(__FILE__) + "/lib/rake_commands.rb")

class MailLoggerGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory File.join("app", "models")
      ["app/models/mail_log.rb"].each do |file|
        m.file file, file
      end
      
      unless ActiveRecord::Base.connection.table_exists?(:mail_logs)
        m.migration_template 'db/migrate/create_mail_logs.rb', 'db/migrate', :migration_file_name => 'create_mail_logs'
      end
      
      m.rake_db_migrate
    end
  end
end