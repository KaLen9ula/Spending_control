class Spending < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :category, presence: true

  scope :accessible_for, -> (user) { where(user:user) }
end