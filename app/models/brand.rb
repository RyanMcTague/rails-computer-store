class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_senitive: false }
  validates :identifier, presence: true, uniqueness: { case_senitive: false }


  state_machine :state, initial: :active do
    state :active
    state :disabled
    state :closed

    event :disable do
      transition :active => :disabled
    end

    event :close do
      transition [:active, :disabled ]=> :closed
    end

    event :reopen do
      transition :closed => :active
    end

    event :activate do
      transition :disabled => :active
    end
  end
end
