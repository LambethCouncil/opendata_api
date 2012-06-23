class Location < ActiveRecord::Base
  attr_accessible :name, :latitude, :longitude, :address, :postcode, :notes
  
  belongs_to :category
  
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :name
  
end