class Incident < ApplicationRecord
  has_many : articles, dependent: :destroy
  validates :incident, presence: true
  validates :solution, presence: true
  
end
