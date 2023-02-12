# frozen_string_literal: true

require 'rails_helper'

describe 'Homepage' do
  let(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post, user: user) }
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let!(:audit_log) { FactoryBot.create(:audit_log, user_id: user.id) }

  before do
    login_as(admin_user, scope: :user)
  end

  it 'allows the admin to approve posts from the homepage' do
    visit root_path

    click_on("approve_#{post.id}")

    expect(post.reload.status).to eq('approved')
  end

  it 'allows the employee to change the audit log status from the homepage the homepage' do
    login_as(user, scope: :user)
    visit root_path

    click_on("confirm_#{audit_log.id}")

    expect(audit_log.reload.status).to eq('confirmed')
  end
end
