# frozen_string_literal: true

class User < ApplicationRecord
  after_create :build_profile

  has_secure_password
  has_many :tasks, dependent: :destroy
  has_one :profile, dependent: :destroy

  validates :username, :email, :password,
            :password_confirmation, presence: true
  validates :email, :username, uniqueness: true
  validates :password, confirmation: true

  validates :username, length: { minimum: 3 }
  def build_profile
    Profile.create(user: self)
  end
end
