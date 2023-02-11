# frozen_string_literal: true

require 'rails_helper'

describe 'AuditLog Feature' do
  let!(:audit_log) { FactoryBot.create(:audit_log) }
  let(:admin) { FactoryBot.create(:admin_user) }
  let(:user) { FactoryBot.create(:user) }

  before do
    login_as(admin, scope: :user)
  end

  describe 'index' do
    it 'has an index page that can be reached' do
      visit audit_logs_path

      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      visit audit_logs_path

      expect(page).to have_content(/TEST, TEST/)
    end

    it 'cannot be accessed by non admin users' do
      logout(:admin)
      login_as(user, scope: :user)

      visit audit_logs_path
      expect(current_path).to eq(root_path)
    end
  end
end
