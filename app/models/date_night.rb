class DateNight < ApplicationRecord
  # Direct associations

  belongs_to :activity

  belongs_to :restaurant

  belongs_to :date,
             :class_name => "User"

  belongs_to :user

  # Indirect associations

  # Validations
  validates :date, :presence => true
  validates :day, :presence => true, :uniqueness => {:scope => :user}
end
