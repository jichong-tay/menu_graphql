# frozen_string_literal: true

module Types
  class ModifierGroupType < Types::BaseObject
    field :id, ID
    field :identifier, String
    field :label, String
    field :selection_required_min, Integer
    field :selection_required_max, Integer
    field :modifiers, [ ModifierType ]
  end
end
