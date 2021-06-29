class CodingLang < ApplicationRecord
  belongs_to :incidents
  validates :name, presence: true
end
