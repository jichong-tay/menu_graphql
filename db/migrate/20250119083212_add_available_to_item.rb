class AddAvailableToItem < ActiveRecord::Migration[7.2]
  def change
     add_column :items, :available, :string, limit: 1, null: false, default: 'Y'
  end
end
