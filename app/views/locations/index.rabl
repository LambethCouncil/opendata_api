collection @categories, :root => "categories", :object_root => false
attribute :title, :id
child :locations do
  attributes :id, :name, :address, :postcode, :latitude, :longitude, :notes
end