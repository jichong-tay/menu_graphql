# frozen_string_literal: true

module Types
  class ItemType < Types::BaseObject
    field :id, ID, null: false
    field :type, String
    field :identifier, String
    field :label, String
    field :description, String
    field :price, Float
    field :modifier_groups, [ ModifierGroupType ]
  end
end
