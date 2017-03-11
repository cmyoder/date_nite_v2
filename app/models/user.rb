class User < ApplicationRecord
  # Direct associations

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
