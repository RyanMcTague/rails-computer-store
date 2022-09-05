class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  validates :firstname, presence: true
  validates :lastname, presence: true
end
