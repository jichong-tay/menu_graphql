# frozen_string_literal: true

module Mutations
  class ModifierGroupUpdate < BaseMutation
    description "Updates a modifier_group"

    field :modifier_group, Types::ModifierGroupType, null: false

    argument :modifier_group_input, Types::Input::ModifierGroupInputType, required: true

    def resolve(modifier_group_input:)
      ActiveRecord::Base.transaction do
        modifier_group = ::ModifierGroup.find(modifier_group_input[:id])
        if modifier_group.update(modifier_group_input.to_h.except(:id, :modifiers))
          if modifier_group_input[:modifiers]
            modifier_group_input[:modifiers].each do |modifier_input|
              modifier = ::Modifier.find(modifier_input[:id])
              unless modifier.update(modifier_input.to_h.except(:id))
                raise GraphQL::ExecutionError.new "Error updating modifier", extensions: modifier.errors.to_hash
              end
            end
          end
          { modifier_group: modifier_group }
        else
          raise GraphQL::ExecutionError.new "Error updating modifier_group", extensions: modifier_group.errors.to_hash
        end
      end
    end
  end
end
