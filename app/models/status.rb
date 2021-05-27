class Status < ApplicationRecord
  validates :status, presence: true
end
