class Request < ApplicationRecord
  # Direct associations

  belongs_to :property,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
