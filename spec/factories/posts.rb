# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { 'Some rationale' }
    daily_hours { 3.5 }
  end
end
