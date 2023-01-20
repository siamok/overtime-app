# frozen_string_literal: true

user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest', first_name: 'Test',
                   last_name: 'Test')

admin_user = AdminUser.create(email: 'admin@admin.com', password: 'adminadmin', password_confirmation: 'adminadmin', first_name: 'Admin',
                              last_name: 'Admin')

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: user.id)
end

pp 'Posts seeded'
