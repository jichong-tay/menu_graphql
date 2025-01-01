# frozen_string_literal: true

module Mutations
  class ModifierGroupCreate < BaseMutation
    description "Creates a new modifier_group and its modifiers"

    field :modifier_group, Types::ModifierGroupType, null: false

    argument :modifier_group_input, Types::Input::ModifierGroupInputType, required: true

    def resolve(modifier_group_input:)
      ActiveRecord::Base.transaction do
        modifier_group = ModifierGroup.new(
          identifier: modifier_group_input[:identifier],
          label: modifier_group_input[:label],
          selection_required_min: modifier_group_input[:selection_required_min],
          selection_required_max: modifier_group_input[:selection_required_max]
        )

        if modifier_group.save
          if modifier_group_input[:modifiers]
            modifier_group_input[:modifiers].each do |modifier_input|
              modifier_group.modifiers.create!(
                item_id: modifier_input[:item_id],
                display_order: modifier_input[:display_order],
                default_quantity: modifier_input[:default_quantity],
                price_override: modifier_input[:price_override]
              )
              ItemModifierGroup.create!(
                item_id: modifier_input[:item_id],
                modifier_group_id: modifier_group.id
                )
            end
          end
          { modifier_group: modifier_group }
        else
          raise GraphQL::ExecutionError.new "Error creating modifier_group", extensions: modifier_group.errors.to_hash
        end
      end
    end
  end
end
