# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Test' }
    last_name { 'Test' }
    email { 'test@test.com' }
    password { 'testtest' }
    password_confirmation { 'testtest' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name { 'Test' }
    email { 'admin@test.com' }
    password { 'testtest' }
    password_confirmation { 'testtest' }
  end
end
