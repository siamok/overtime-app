# frozen_string_literal: true

module SmsTool
  def self.send_sms(number:, message:)
    puts "Sending SMS..."
    puts "#{message} to #{number}"
  end
end
