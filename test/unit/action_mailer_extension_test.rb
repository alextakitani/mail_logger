require File.join(File.dirname(__FILE__), "../test_helper")
 
class ActionMailerExtensionTest < ActiveSupport::TestCase
  context "sending a valid email" do
    should "trigger the default #deliver!" do
      mailer = FakeMailer.new(nil)
      assert_equal "sent email", mailer.deliver!
    end
    
    should "not attempt to create a new mail log if mail is nil" do
      mailer = FakeMailer.new(nil)
      MailLog.expects(:create_from_mail).never
      assert_equal "sent email", mailer.deliver!
    end
    
    should "attempt to create a new mail log if email if present" do
      email = ValidEmail.new
      email.to = email.from = ["user@example.com"]
      mailer = FakeMailer.new(email)
      MailLog.expects(:create_from_mail).with(email)
      assert_equal "sent email", mailer.deliver!
    end
    
    should "proceed even if MailLog raises an error" do
      mailer = FakeMailer.new("my email")
      MailLog.expects(:create_from_mail).with("my email").raises("an error")
      assert_equal "sent email", mailer.deliver!
    end
  end
end