class Role < ApplicationRecord
  # belongs_to :user
  has_one :user
  validates :name, presence: true

  serialize :permissions, Hash
end
