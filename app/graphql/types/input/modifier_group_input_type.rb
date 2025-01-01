# frozen_string_literal: true

module Types
  module Input
    class ModifierGroupInputType < BaseInputObject
      argument :id, ID, required: false
      argument :identifier, String, required: true
      argument :label, String, required: true
      argument :selection_required_min, Integer, required: true
      argument :selection_required_max, Integer, required: true
      argument :modifiers, [ Types::Input:: ModifierInputType ], required: false
    end
  end
end
