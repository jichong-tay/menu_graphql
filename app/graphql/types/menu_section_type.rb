# frozen_string_literal: true

module Types
  class MenuSectionType < Types::BaseObject
    field :id, ID, null: false
    field :display_order, Integer
    field :section, SectionType, null: false
  end
end
