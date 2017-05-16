class AddPropertyReviewCountToProperties < ActiveRecord::Migration[5.0]
  def change
    add_column :properties, :property_reviews_count, :integer
  end
end
