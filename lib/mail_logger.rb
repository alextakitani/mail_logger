require "mail_logger/app/models/mail_log"
require "mail_logger/lib/extensions/action_mailer"

ActionMailer::Base.send :include, MailLogger::Lib::Extensions::ActionMailer