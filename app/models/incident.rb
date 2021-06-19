class Incident < ApplicationRecord
  has_many : articles, dependent: :destroy
  has_many : articled_users, through: :articles, source: :user
  validates :incident, presence: true
  validates :solution, presence: true
  
end
