# frozen_string_literal: true

namespace :notification do
  desc 'Send SMS notification to employees asking them to log if they have overtime'
  task sms: :environment do
    User.all.each do |user|
      SmsTool.send_sms()
    end
  end
end
