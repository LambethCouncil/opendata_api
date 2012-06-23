object false
 
node :category do 
  @category
end

child @locations do
  attributes :id, :name, :address, :postcode, :latitude, :longitude, :notes
end