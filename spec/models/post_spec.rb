# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    let(:user) { FactoryBot.create(:user) }
    let(:post) { FactoryBot.create(:post, user: user) }

    it 'can be created' do
      expect(post).to be_valid
    end

    it 'cannot be created without date and rationale' do
      post.date = nil
      post.rationale = nil

      expect(post).to_not be_valid
    end
  end
end
