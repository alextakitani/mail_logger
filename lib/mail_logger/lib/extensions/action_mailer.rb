module MailLogger
  module Lib
    module Extensions
      module ActionMailer
        def self.included(base)
          base.class_eval do
            def deliver_with_hooks!(*args)
              mail = args.first || @mail # depend on ActionMailer::Base's @mail ivar is pretty nasty but has to be done
              if !mail.nil?
                begin
                  logger.info "MailLogger logged #{mail.encoded}" unless logger.nil?
                  MailLog.create_from_mail(mail)
                rescue
                  logger.info "MailLogger failed" unless logger.nil?
                end
              end
              
              deliver_without_hooks!(*args)
            end
            
            alias_method_chain :deliver!, :hooks
          end
        end
      end
    end
  end
end