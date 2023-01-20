# frozen_string_literal: true

require 'rails_helper'

describe 'admin dashboard' do
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin_user) }

  it 'does not allow users to access without being signed in' do
    visit admin_root_path
    expect(page.current_path).to eq(new_user_session_path)
  end

  it 'cannot be reached by a non admin users' do
    login_as(user, scope: :user)

    visit admin_root_path

    expect(page.current_path).to eq(root_path)
  end

  it 'can be reached by an admin users' do
    login_as(admin, scope: :user)

    visit admin_root_path

    expect(page.current_path).to eq(admin_root_path)
  end
end
