# frozen_string_literal: true

namespace :notification do
  desc 'Send SMS notification to employees asking them to log if they have overtime'
  task sms: :environment do
    User.all.each do |_user|
      SmsTool.send_sms
    end
  end

  desc 'Send email notification to managers each day to inform of pending overtime requests'
  task manager_email: :environment do
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    unless submitted_posts.blank?
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_later
      end
    end
  end
end
