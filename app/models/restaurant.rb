class Restaurant < ApplicationRecord
  has_many :reviews
  belongs_to :category
  validates_presence_of :name, :description, :city, :state_provence

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address1, address2, city, state_provence, postalcode].join(', ')
  end
end
