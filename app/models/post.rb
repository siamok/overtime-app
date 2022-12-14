# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  validates_presence_of :date, :rationale
end
