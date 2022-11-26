# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { 'Some rationale' }
  end

  factory :second_post, class: 'Post' do
    date { Date.yesterday }
    rationale { 'Rationale2' }
  end
end
