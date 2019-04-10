# frozen_string_literal: true

class Task < ApplicationRecord
  msg = ' name must be in range between 3 and 20 characters'
  belongs_to :user
  validates :user, presence: true
  validates :title, :description, presence: true
  validates :title, length: { in: 3..20,
                              message: msg }
  validates :description, length: {
    maximum: 200,
    too_long: '%{count} characters is the maximum allowed!'
  }
end
