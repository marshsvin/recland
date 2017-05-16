class AddAddressLongitudeToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :address_longitude, :float
  end
end
