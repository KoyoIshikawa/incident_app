class Article < ApplicationRecord
  belongs_to :user
  belongs_to :incident
  validates :content, presence: true
end
