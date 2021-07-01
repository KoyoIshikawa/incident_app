class OsName < ApplicationRecord
  has_many :incidents, dependent: :destroy
  validates :name, presence: true
end
