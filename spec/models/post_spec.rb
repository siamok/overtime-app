# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post, user: user) }

    it 'can be created' do
      expect(post).to be_valid
    end

    it 'cannot be created without date, rationale and overtime' do
      post.date = nil
      post.rationale = nil
      post.daily_hours = nil

      expect(post).to_not be_valid
    end

    it 'has an daily_hours greater than 0.0' do
      post.daily_hours = 0.0

      expect(post).to_not be_valid
    end
  end
end
