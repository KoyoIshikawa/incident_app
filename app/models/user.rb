class User < ApplicationRecord
  has_many :incidents, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :articled_incidents, through: :articles, source: :incident
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
