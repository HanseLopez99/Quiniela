class User < ApplicationRecord
  # Create associations
  has_many :boards

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Create enums for the user model

  # Create callbacks for the user model

  after_initialize :set_defaults

  # Create a method to set the default points
  def set_defaults
    self.points ||= 0
  end

end
