# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  let(:user) do
    FactoryBot.create(:user)
  end

  let(:post) { FactoryBot.create(:post, user: user) }
  let(:second_post) { FactoryBot.create(:second_post, user: user) }

  before do
    login_as(user, scope: :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end

    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a list of posts' do
      post
      second_post

      visit posts_path
      expect(page).to have_content(/Some rationale|Rationale2/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      visit root_path

      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      post
      visit posts_path

      click_link("delete_post_#{post.id}_from_index")
      expect(page.status_code).to eq(200)
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
      fill_in 'post[rationale]', with: 'Rationale'
      click_on 'Save'

      expect(page).to have_content('Rationale')
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end

  describe 'edit' do
    before do
      post
    end

    it 'can be reached by clicking edit on index page' do
      post
      visit posts_path

      click_link("edit_#{post.id}")
      expect(page.status_code).to eq(200)
    end

    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on 'Save'

      expect(page).to have_content('Edited content')
    end
  end
end
