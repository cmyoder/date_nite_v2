class Activity < ApplicationRecord
  # Direct associations

  belongs_to :contributor,
             :class_name => "User"

  # Indirect associations

  # Validations

end
