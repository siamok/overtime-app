# frozen_string_literal: true

require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryBot.create(:user) }
  let(:another_user) { FactoryBot.create(:user, email: 'another@mail.com') }
  let(:non_authorized_user) { FactoryBot.create(:non_authorized_user) }

  let(:post) { FactoryBot.create(:post, user: user) }
  let(:second_post) { FactoryBot.create(:post, date: Date.yesterday, rationale: 'Rationale2', user: user) }
  let(:third_post) { FactoryBot.create(:post, rationale: 'Another User', user: another_user) }
  let(:employee) do
    Employee.create(email: 'test@testing.com', password: 'testtest', password_confirmation: 'testtest', first_name: 'Test',
                    last_name: 'Testing', phone: '45646464504')
  end

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

    it 'has a scope of post creator can see their posts' do
      post
      second_post
      third_post

      visit posts_path
      expect(page).to_not have_content(/Another User/)
    end
  end

  describe 'new' do
    it 'has a link from the homepage' do
      login_as(employee, scope: :user)

      visit root_path

      click_link('new_post_from_nav')
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      post
      visit posts_path

      click_button("delete_post_#{post.id}_from_index")
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
      fill_in 'post[overtime_request]', with: '2.5'
      expect { click_on 'Save' }.to change(Post, :count).by(1)
    end

    it 'will have a user associated with it' do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'User Association'
      fill_in 'post[overtime_request]', with: '2.5'

      click_on 'Save'

      expect(User.last.posts.last.rationale).to eq('User Association')
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post)

      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: 'Edited content'
      click_on 'Save'

      expect(page).to have_content('Edited content')
    end

    it 'cannot be edited by a non authorized user' do
      logout(:user)
      login_as(non_authorized_user, scope: :user)

      visit edit_post_path(post)
      expect(current_path).to eq(root_path)
    end
  end
end
