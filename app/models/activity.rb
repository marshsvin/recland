class Activity < ApplicationRecord
  # Direct associations

  belongs_to :activities,
             :class_name => "Property"

  # Indirect associations

  # Validations

end
