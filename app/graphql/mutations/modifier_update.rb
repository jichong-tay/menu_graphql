# frozen_string_literal: true

module Mutations
  class ModifierUpdate < BaseMutation
    description "Updates a modifier by id"

    field :modifier, Types::ModifierType, null: false

    argument :modifier_input, Types::Input::ModifierInputType, required: true

    def resolve(modifier_input:)
      modifier = ::Modifier.find(modifier_input[:id])
      raise GraphQL::ExecutionError.new "Error updating modifier", extensions: modifier.errors.to_hash unless modifier.update(modifier_input.to_h.except(:id, :item_id, :modifier_group_id))

      { modifier: modifier }
    end
  end
end
