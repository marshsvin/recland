class AddAddressLatitudeToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :address_latitude, :float
  end
end
