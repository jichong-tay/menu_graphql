class ModifierGroup < ApplicationRecord
  has_many :modifiers, dependent: :destroy
  has_many :item_modifier_group, dependent: :destroy
  has_many :item, through: :item_modifier_group

  validates :identifier, :label, presence: true
end
