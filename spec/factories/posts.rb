# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { 'Some rationale' }
    overtime_request { 3.5 }
  end
end
