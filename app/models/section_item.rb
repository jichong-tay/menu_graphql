class SectionItem < ApplicationRecord
  belongs_to :section
  belongs_to :item

  validates :section, :item, presence: true
end
