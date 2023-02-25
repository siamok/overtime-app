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

    it 'requires the ssn attr' do
      user.ssn = nil
      expect(user).to_not be_valid
    end

    it 'requires a company' do
      user.company = nil
      expect(user).to_not be_valid
    end

    it 'requires the ssn attr to only contain integers' do
      user.ssn = 'str'
      expect(user).to_not be_valid
    end

    it 'requires the phone attr to only habe 4 chars' do
      user.ssn = 12345
      expect(user).to_not be_valid
    end
  end

  describe 'custom name methods' do
    it 'has a full name method that combines first and last name' do
      expect(user.full_name).to eq('TEST, TEST')
    end
  end

  describe 'relationship between admins and employees' do
    let(:employee_1) { FactoryBot.create(:user) }
    let(:employee_2) { FactoryBot.create(:user) }
    let(:admin_user) { FactoryBot.create(:admin_user) }

    it 'allows for admins to be associated with multiple employees' do
      Hand.create!(user_id: admin_user.id, hand_id: employee_1.id)
      Hand.create!(user_id: admin_user.id, hand_id: employee_2.id)

      expect(admin_user.hands.count).to eq(2)
    end
  end
end
