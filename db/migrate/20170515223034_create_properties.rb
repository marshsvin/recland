class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :user_id
      t.string :address
      t.integer :zip_code
      t.string :state
      t.string :city
      t.float :acreage
      t.string :description
      t.float :price

      t.timestamps

    end
  end
end
