class Product < ApplicationRecord
  belongs_to :department
  belongs_to :brand

  validates :name, presence: true, uniqueness: { case_senitive: false }
end
