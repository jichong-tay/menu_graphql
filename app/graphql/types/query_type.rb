# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
    #   argument :id, ID, required: true, description: "ID of the object."
    # end

    # def node(id:)
    #   context.schema.object_from_id(id, context)
    # end

    # field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
    #   argument :ids, [ID], required: true, description: "IDs of the objects."
    # end

    # def nodes(ids:)
    #   ids.map { |id| context.schema.object_from_id(id, context) }
    # end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end
    field :menus, [ MenuType ], null: false do
      description "Retrieve all menus"
    end

    def menus
      Menu.all
    end

    field :sections, [ SectionType ], null: false do
      description "Retrieve all sections"
    end

    def sections
      Section.all
    end

    field :items, [ ItemType ], null: false do
      description "Retrieve all items"
    end

    def items
      Item.all
    end

    field :modifiers, [ ModifierType ], null: false do
      description "Retrieve all modifiers"
    end

    def modifiers
      Modifier.all
    end

    field :modifier_groups, [ ModifierGroupType ], null: false do
      description "Retrieve all modifier groups"
    end

    def modifier_groups
      ModifierGroup.all
    end
  end
end
