# frozen_string_literal: true

module Types
  class ModifierType < Types::BaseObject
    field :id, ID
    field :item, ItemType
    field :modifier_group, ModifierGroupType
    field :display_order, Integer
    field :default_quantity, Integer
    field :price_override, Float
  end
end
