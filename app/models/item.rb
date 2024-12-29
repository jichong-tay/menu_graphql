class Item < ApplicationRecord
  has_many :section_items
  has_many :sections, through: :section_items
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups
  self.inheritance_column = nil # Disables STI, treating type as a normal column

  # Validation for type
  validates :type, inclusion: { in: [ "Product", "Component" ], message: "%{value} is not a valid type" }
  validates :identifier, :label, :price, presence: true
end
