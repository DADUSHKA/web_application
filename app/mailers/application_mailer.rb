# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "#{'TestGuru'<testguru@mail.com>}"
  layout 'mailer'
end
