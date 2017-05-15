class Property < ApplicationRecord
  # Direct associations

  has_many   :property_reviews,
             :dependent => :destroy

  has_many   :pictures

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
