# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'mailer@test.com'
  layout 'mailer'
end
