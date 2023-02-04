# frozen_string_literal: true

user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest', first_name: 'Test',
                   last_name: 'Test', phone: ENV['VERIFIED_NUMBER'])

admin_user = AdminUser.create(email: 'admin@admin.com', password: 'adminadmin', password_confirmation: 'adminadmin', first_name: 'Admin',
                              last_name: 'Admin', phone: ENV['VERIFIED_NUMBER'])

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: user.id, overtime_request: 2.5)
end

pp 'Posts seeded'
