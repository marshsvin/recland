class Picture < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :property

  # Indirect associations

  # Validations

end
