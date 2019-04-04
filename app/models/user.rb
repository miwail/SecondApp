class User < ApplicationRecord
  after_create :build_profile

  has_secure_password
  has_many :tasks, dependent: :destroy
  has_one :profile, dependent: :destroy

  def build_profile
    Profile.create(user: self)
  end
end
