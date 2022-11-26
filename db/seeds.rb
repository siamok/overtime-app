# frozen_string_literal: true

user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest', first_name: 'Test',
                   last_name: 'Test')

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: user.id)
end

pp 'Posts seeded'
