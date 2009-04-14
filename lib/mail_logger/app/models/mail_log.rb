module MailLogger
  module App
    module Models
      module MailLog
        def self.included(base)
          base.extend ClassMethods
        end
        
        module ClassMethods
          def create_from_mail(email)
            [:to, :from, :subject, :quoted_body, :encoded].each do |att|
              return unless email.respond_to?(att)
            end
            
            self.create(:to => email.to.join(", "), :from => email.from.join(", "), :subject => email.subject, :body => email.quoted_body, :message => email.encoded)
          end
        end
      end
    end
  end
end