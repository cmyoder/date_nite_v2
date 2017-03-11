class User < ApplicationRecord
  # Direct associations

  has_many   :date_night_invites,
             :class_name => "DateNight",
             :foreign_key => "date_id",
             :dependent => :destroy

  has_many   :date_night_plans,
             :class_name => "DateNight",
             :dependent => :destroy

  has_many   :activities,
             :foreign_key => "contributor_id",
             :dependent => :destroy

  has_many   :restaurants,
             :foreign_key => "contributor_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
