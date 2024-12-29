class ModifierGroup < ApplicationRecord
  has_many :modifiers, dependent: :destroy
  has_one :item_modifier_group, dependent: :destroy
  has_one :item, through: :item_modifier_group

  validates :identifier, :label, presence: true
end
