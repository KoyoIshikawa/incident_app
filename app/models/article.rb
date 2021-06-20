class Article < ApplicationRecord
  belongs_to :user
  belongs_to :incident
  validate :content, presence: true
end
