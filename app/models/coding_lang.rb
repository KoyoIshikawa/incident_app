class CodingLang < ApplicationRecord
  has_many :incidents, dependent: :destroy
  validates :name, presence: true
end
