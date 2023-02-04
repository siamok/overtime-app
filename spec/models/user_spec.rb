# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe 'creation' do
    it 'it can be created' do
      expect(user).to be_valid
    end
  end

  describe 'validations' do
    it 'cannot be created without first_name' do
      user.first_name = nil

      expect(user).to_not be_valid
    end

    it 'cannot be created without last_name' do
      user.last_name = nil

      expect(user).to_not be_valid
    end

    it 'cannot be created without phone' do
      user.phone = nil

      expect(user).to_not be_valid
    end

    it 'requires the phone attr to only contain integers' do
      user.phone = 'testtestte'
      expect(user).to_not be_valid
    end

    it 'requires the phone attr to only habe 11 chars' do
      user.phone = '123456789003'
      expect(user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name method that combines first and last name' do
      expect(user.full_name).to eq('TEST, TEST')
    end
  end
end
