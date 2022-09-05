class Department < ApplicationRecord
  
  enum department_type: { 
    components: "components", 
    storage_devices: "storage devices",
    accessories: "accessories"  
  }

  validates :name, presence: true, uniqueness: { case_senitive: false }
end
