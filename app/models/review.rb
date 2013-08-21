class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  attr_accessible :comment

  validates :user, :presence => true
  validates :product, :presence => true

end