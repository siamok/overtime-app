# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name, :phone

  PHONE_REGEX = /\A[0-9]*\Z/.freeze

  validates_format_of :phone, with: PHONE_REGEX
  validates :phone, length: { is: 11 }

  def full_name
    "#{last_name.upcase}, #{first_name.upcase}"
  end
end
