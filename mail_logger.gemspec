# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{mail_logger}
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Fusionary Media, Josh Clayton"]
  s.date = %q{2009-04-17}
  s.description = %q{Braindead-simple email logger for ActionMailer using ActiveRecord}
  s.email = %q{joshua.clayton@gmail.com}
  s.extra_rdoc_files = ["lib/mail_logger/app/models/mail_log.rb", "lib/mail_logger/lib/extensions/action_mailer.rb", "lib/mail_logger.rb", "README.textile"]
  s.files = ["generators/mail_logger/lib/rake_commands.rb", "generators/mail_logger/mail_logger_generator.rb", "generators/mail_logger/templates/app/models/mail_log.rb", "generators/mail_logger/templates/db/migrate/create_mail_logs.rb", "generators/mail_logger/USAGE", "lib/mail_logger/app/models/mail_log.rb", "lib/mail_logger/lib/extensions/action_mailer.rb", "lib/mail_logger.rb", "mail_logger.gemspec", "Manifest", "MIT-LICENSE", "rails/init.rb", "Rakefile", "README.textile", "test/test_helper.rb", "test/unit/action_mailer_extension_test.rb", "test/unit/mail_log_test.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/fusionary/mail_logger}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Mail_logger", "--main", "README.textile"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{mail_logger}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Braindead-simple email logger for ActionMailer using ActiveRecord}
  s.test_files = ["test/test_helper.rb", "test/unit/action_mailer_extension_test.rb", "test/unit/mail_log_test.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<actionmailer>, [">= 0", ">= 2.1.0"])
    else
      s.add_dependency(%q<actionmailer>, [">= 0", ">= 2.1.0"])
    end
  else
    s.add_dependency(%q<actionmailer>, [">= 0", ">= 2.1.0"])
  end
end
