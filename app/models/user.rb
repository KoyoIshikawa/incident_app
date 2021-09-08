class User < ApplicationRecord
  has_many :incidents, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :articled_incidents, through: :articles, source: :incident
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :authentication_keys => [:username]
  validates :username, uniqueness: true
  validates :email, uniqueness: true
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.username = "guest"
    end
  end
end
