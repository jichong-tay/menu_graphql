class AddAvailableToSection < ActiveRecord::Migration[7.2]
  def change
      add_column :sections, :available, :string, limit: 1, null: false, default: 'Y'
  end
end
