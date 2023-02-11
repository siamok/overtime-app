# frozen_string_literal: true

require 'rails_helper'

describe 'Homepage' do
  let(:user) { FactoryBot.create(:user) }
  let!(:post) { FactoryBot.create(:post, user: user) }
  let(:admin_user) { FactoryBot.create(:admin_user) }

  before do
    login_as(admin_user, scope: :user)
  end

  it 'allows the admin to approve posts from the homepage' do
    visit root_path

    click_on("approve_#{post.id}")

    expect(post.reload.status).to eq('approved')
  end
end
