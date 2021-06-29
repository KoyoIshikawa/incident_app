class Incident < ApplicationRecord
  belongs_to :user
  has_many :os_names, dependent: :destroy
  has_many :statuses, dependent: :destroy
  has_many :coding_langs, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :articled_users, through: :articles, source: :user
  validates :incident, presence: true
  validates :solution, presence: true
  
end
