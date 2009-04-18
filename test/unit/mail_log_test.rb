require File.join(File.dirname(__FILE__), "../test_helper")
 
class MailLogTest < ActiveSupport::TestCase
  context "Mail log creation" do
    setup { MailLog.stubs(:create) }
    
    should "ensure the email responds to the correct methods" do
      email = ValidEmail.new
      email.to = email.from = ["user@example.com"]
      
      [:to, :from, :subject, :quoted_body, :encoded].each do |att|
        email.expects(:respond_to?).with(att).returns(true)
      end
      
      MailLog.create_from_mail(email)
    end
    
    should "raise an error if the object is not an email" do
      assert_raise ArgumentError, "object is not an email" do
        MailLog.create_from_mail("not an email")
      end
    end
    
    should "raise an error if to or from is not set" do
      email = ValidEmail.new
      email.to = ["user@example.com"]
      assert_raise ArgumentError, "email does not have attribute 'from' assigned" do
        MailLog.create_from_mail(email)
      end
      
      email.from, email.to = ["user@example.com"]
      assert_raise ArgumentError, "email does not have attribute 'to' assigned" do
        MailLog.create_from_mail(email)
      end
    end
    
    should "pass all attributes when creating a new mail log" do
      email = ValidEmail.new
      email.from        = ["user-1@example.com", "user-2@example.com"]
      email.to          = ["user-3@example.com", "user-4@example.com"]
      email.subject     = "Subject line"
      email.quoted_body = "This is a quoted body"
      email.encoded     = "Encoded message"
      
      MailLog.expects(:create).with({:from => "user-1@example.com, user-2@example.com", :to => "user-3@example.com, user-4@example.com", :subject => "Subject line", :body => "This is a quoted body", :message => "Encoded message"})
      MailLog.create_from_mail(email)
    end
  end
end