# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  let(:user) { User.create(email: 'test@test.com', password: 'testtest', password_confirmation: 'testtest', first_name: 'Test', last_name: 'Test') }

  before do
    login_as(user, scope: :user)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit posts_path

      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      visit posts_path

      expect(page).to have_content(/Posts/)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "Rationale"
      click_on "Save"

      expect(page).to have_content("Rationale")
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "User Association"
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq("User Association")
    end
  end
end
