class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price_in_cents

  validates :name, :presence => true
  validates :description, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}  

  has_many :reviews

  def formatted_price
    "$#{(self[:price_in_cents].to_f/100)}"
  end
end
