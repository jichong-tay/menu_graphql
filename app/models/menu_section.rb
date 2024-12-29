class MenuSection < ApplicationRecord
  belongs_to :menu
  belongs_to :section

  validates :menu, :section, presence: true
end
