class Department < ApplicationRecord
  
  enum department_type: { 
    components: "components", 
    storage_devices: "storage devices",
    accessories: "accessories"  
  }
  
  has_many :products
  has_many :brands, through: :products
  validates :name, presence: true, uniqueness: { case_senitive: false }
end
