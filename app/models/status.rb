class Status < ApplicationRecord
    has_many :incidents, dependent: :destroy
  validates :status, presence: true
end
