# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  before do
    @user = User.create(
      email: 'test@test.com',
      password: 'testtest',
      password_confirmation: 'testtest',
      first_name: 'Test',
      last_name: 'Test'
    )
  end

  describe 'creation' do
    it 'it can be created' do
      expect(@user).to be_valid
    end

    it 'cannot be created without first_name, last_name' do
      @user.first_name = nil
      @user.last_name = nil

      expect(@user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name method that combines first and last name' do
      expect(@user.full_name).to eq('TEST, TEST')
    end
  end
end
