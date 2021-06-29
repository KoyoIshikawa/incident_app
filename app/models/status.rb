class Status < ApplicationRecord
  belongs_to :incidents
  validates :status, presence: true
end
