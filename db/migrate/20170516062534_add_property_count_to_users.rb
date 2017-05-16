class AddPropertyCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :properties_count, :integer
  end
end
