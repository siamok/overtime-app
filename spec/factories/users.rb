# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Test' }
    last_name { 'Test' }
    email { 'test@test.com' }
    password { 'testtest' }
    password_confirmation { 'testtest' }
    phone
  end

  factory :non_authorized_user, class: 'User' do
    first_name { 'non_authorized_user' }
    last_name { 'non_authorized_user' }
    email { 'non@non.com' }
    password { 'nonnon' }
    password_confirmation { 'nonnon' }
    phone
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name { 'Test' }
    email { 'admin@test.com' }
    password { 'testtest' }
    password_confirmation { 'testtest' }
    phone
  end

  sequence :phone do |n|
    "#{n}".ljust(11, '0')
  end
end
