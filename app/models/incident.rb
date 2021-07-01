class Incident < ApplicationRecord
  belongs_to :user
  belongs_to :os_name
  belongs_to :status
  belongs_to :coding_lang
  has_many :articles, dependent: :destroy
  has_many :articled_users, through: :articles, source: :user
  validates :incident, presence: true
  validates :solution, presence: true
  
end
