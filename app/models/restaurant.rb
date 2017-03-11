class Restaurant < ApplicationRecord
  # Direct associations

  has_many   :date_nights,
             :dependent => :destroy

  belongs_to :contributor,
             :class_name => "User"

  # Indirect associations

  # Validations

end
