# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  let(:admin_user) { FactoryBot.create(:admin_user) }
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, user: user) }

  before do
    login_as(admin_user, scope: :user)
  end

  describe 'edit' do
    it 'has a status that can be edited on the form by an admin' do
      visit edit_post_path(post)

      choose('post_status_approved')
      click_on('Save')

      expect(post.reload.status).to eq('approved')
    end

    it 'cannot be edited by a non admin' do
      logout(:admin_user)
      login_as(user, scope: :user)

      visit edit_post_path(post)

      expect(page).to_not have_content('Approved')
    end
  end
end
