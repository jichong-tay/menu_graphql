# frozen_string_literal: true

module Mutations
  class ModifierGroupDelete < BaseMutation
    description "Deletes a modifier_group by ID"

    field :modifier_group, Types::ModifierGroupType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      modifier_group = ::ModifierGroup.find(id)
      raise GraphQL::ExecutionError.new "Error deleting modifier_group", extensions: modifier_group.errors.to_hash unless modifier_group.destroy!

      { modifier_group: modifier_group }
    end
  end
end
