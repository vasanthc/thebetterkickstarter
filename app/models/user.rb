class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :username
  has_secure_password
  validates_presence_of :password, :on => :create

  validates :email, {
    :uniqueness => true,
    :presence => true
  }

  validates :username, {
    :length => {:minimum => 3},
    :presence => true,
    :uniqueness => true
  }

  def username_string
    self[self[:username].present? ? :username : :email]
  end
end