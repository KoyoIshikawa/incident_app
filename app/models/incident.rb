class Incident < ApplicationRecord
  validates :incident, presence: true
  validates :solution, presence: true
end
