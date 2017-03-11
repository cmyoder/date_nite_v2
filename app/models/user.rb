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

  has_many   :date_inviters,
             :through => :date_night_invites,
             :source => :user

  has_many   :date_invitees,
             :through => :date_night_plans,
             :source => :date

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
