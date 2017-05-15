class AddRequestCountToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :requests_count, :integer
  end
end
