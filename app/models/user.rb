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

  def self.from_omniauth(auth)
      if self.where(email: auth.info.email).exists?
        return_user =self.where(email: auth.info.email).first
      else
        return_user = self.create do |user|
          user.password = '123123'
          #
          user.email = auth.info.email
        end
      end
    return_user
  end
end
