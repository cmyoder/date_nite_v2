class DateNight < ApplicationRecord
  # Direct associations

  belongs_to :restaurant

  belongs_to :date,
             :class_name => "User"

  belongs_to :user

  # Indirect associations

  # Validations

end
