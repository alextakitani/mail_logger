module MailLogger
  module App
    module Models
      module MailLog
        def self.included(base)
          base.extend ClassMethods
        end
        
        module ClassMethods
          def create_from_mail(email)
            ensure_object_is_email(email)
            ensure_required_attributes_are_assigned(email)
            
            self.create(:to => email.to.join(", "), :from => email.from.join(", "), :subject => email.subject, :body => email.quoted_body, :message => email.encoded)
          end
          
          private
          
          def ensure_object_is_email(email)
            [:to, :from, :subject, :quoted_body, :encoded].each do |att|
              raise(ArgumentError, "object is not an email") unless email.respond_to?(att)
            end
          end
          
          def ensure_required_attributes_are_assigned(email)
            [:to, :from].each do |required_att|
              raise(ArgumentError, "email does not have attribute '#{required_att}' assigned") if email.send(required_att).blank?
            end
          end
        end
      end
    end
  end
end