class Item < ApplicationRecord
  self.inheritance_column = nil # Disables STI, treating type as a normal column
  has_one :section_item, dependent: :destroy
  has_one :section, through: :section_item
  has_one :modifier, dependent: :destroy
  has_many :item_modifier_groups
  has_many :modifier_groups, through: :item_modifier_groups

  # Validation for type
  validates :type, inclusion: { in: [ "Product", "Component" ], message: "%{value} is not a valid type" }
  validates :identifier, :label, :price, presence: true
end
