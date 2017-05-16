class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :property_id
      t.date :start_date
      t.date :end_date
      t.integer :user_id
      t.boolean :acceptance
      t.string :user_review

      t.timestamps

    end
  end
end
