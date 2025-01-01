# frozen_string_literal: true

module Types
  module Input
    class ModifierInputType < Types::BaseInputObject
      argument :id, ID, required: false
      argument :item_id, ID, required: false
      argument :modifier_group_id, ID, required: false
      argument :display_order, Integer, required: false
      argument :default_quantity, Integer, required: false
      argument :price_override, Float, required: false
    end
  end
end
