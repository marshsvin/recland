class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :activities_id
      t.boolean :hunting
      t.boolean :fishing
      t.boolean :dirt_biking
      t.boolean :mountain_biking
      t.boolean :atv_riding
      t.boolean :hiking

      t.timestamps

    end
  end
end
