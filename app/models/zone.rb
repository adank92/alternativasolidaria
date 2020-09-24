class Zone < ApplicationRecord
  has_and_belongs_to_many :localities

  validates_presence_of :name
end
