# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :modifier_group_delete, mutation: Mutations::ModifierGroupDelete
    field :modifier_delete, mutation: Mutations::ModifierDelete
    field :modifier_update, mutation: Mutations::ModifierUpdate
    field :modifier_group_update, mutation: Mutations::ModifierGroupUpdate
    field :modifier_create, mutation: Mutations::ModifierCreate
    field :modifier_group_create, mutation: Mutations::ModifierGroupCreate

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end
  end
end
