# frozen_string_literal: true

module Mutations
  class ModifierDelete < BaseMutation
    description "Deletes a modifier by ID"

    field :modifier, Types::ModifierType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      modifier = ::Modifier.find(id)
      raise GraphQL::ExecutionError.new "Error deleting modifier", extensions: modifier.errors.to_hash unless modifier.destroy!

      { modifier: modifier }
    end
  end
end
