# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Test' }
    last_name { 'Test' }
    email { generate(:email) }
    password { 'testtest' }
    password_confirmation { 'testtest' }
    phone
    ssn { 1234 }
    company { 'Test Company' }
  end

  factory :non_authorized_user, class: 'User' do
    first_name { 'non_authorized_user' }
    last_name { 'non_authorized_user' }
    email { 'non@non.com' }
    password { 'nonnon' }
    password_confirmation { 'nonnon' }
    phone
    ssn { 1234 }
    company { 'Test Company' }
  end

  factory :admin_user, class: 'AdminUser' do
    first_name { 'Admin' }
    last_name { 'Test' }
    email { 'admin@test.com' }
    password { 'testtest' }
    password_confirmation { 'testtest' }
    phone
    ssn { 1234 }
    company { 'Test Company' }
  end

  sequence :phone do |n|
    n.to_s.ljust(11, '0')
  end

  sequence :email do |n|
    "test#{n}@test.com"
  end
end
