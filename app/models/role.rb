class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles
  
  belongs_to :resource,
             :polymorphic => true,
             :optional => true
  

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify

  validate :no_resource_name, if: -> { self.resource.nil? }
  validate :brand_name, if: -> { self.resource.is_a? Department }

  private

  def brand_name
    roles = [:brand_manager]
    unless roles.include?(self.name.to_sym)
      self.errors.add(self.name, "is not a valid role name")
    end
  end

  def no_resource_name
    roles = [:admin, :staff]
    unless roles.include?(self.name.to_sym)
      self.errors.add(self.name, "is not a valid role name")
    end
  end
end
