# frozen_string_literal: true

class AuditLog < ApplicationRecord
  enum status: { pending: 0, confirmed: 1 }

  belongs_to :user

  validates_presence_of :user_id, :status, :start_date

  after_initialize :set_defaults

  before_update :set_end_date, if: :confirmed?

  scope :by_start_date, -> { order('start_date DESC') }

  private

  def set_end_date
    self.end_date = Date.today
  end

  def set_defaults
    self.start_date ||= 6.days.ago
  end
end
