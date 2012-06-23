collection @location
attributes :id, :name, :address, :postcode, :latitude, :longitude, :notes
node :category do |l|
  l.category.title
end