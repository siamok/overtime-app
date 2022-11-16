# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'creation' do
    before do
      user = User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest', first_name: 'Test', last_name: 'Test')
      @post = Post.create(date: Date.today, rationale: 'test', user_id: user.id)
    end
    it 'can be created' do
      expect(@post).to be_valid
    end

    it 'cannot be created without date and rationale' do
      @post.date = nil
      @post.rationale = nil

      expect(@post).to_not be_valid
    end
  end
end
