require 'rubygems'
require 'test/unit'
require 'active_support'
require 'active_support/test_case'

require File.join(File.dirname(__FILE__), "../rails/init")
 
require 'redgreen'
require 'shoulda'

class MailLog
  include MailLogger::App::Models::MailLog
end

class FakeMailer
  def initialize(email)
    @mail = email
  end
  
  def deliver!(*args)
    "sent email"
  end
end

FakeMailer.send :include, MailLogger::Lib::Extensions::ActionMailer

class ValidEmail
  attr_accessor :to, :from, :subject, :quoted_body, :encoded
end