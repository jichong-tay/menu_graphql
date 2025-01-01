# frozen_string_literal: true

module Mutations
  class ModifierCreate < BaseMutation
    description "Creates a new modifier"

    field :modifier, Types::ModifierType, null: false

    argument :modifier_input, Types::Input::ModifierInputType, required: true

    def resolve(modifier_input:)
      modifier = ::Modifier.new(**modifier_input)
      raise GraphQL::ExecutionError.new "Error creating modifier", extensions: modifier.errors.to_hash unless modifier.save

      { modifier: modifier }
    end
  end
end
