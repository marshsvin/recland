class AddAddressFormattedAddressToProperty < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :address_formatted_address, :string
  end
end
