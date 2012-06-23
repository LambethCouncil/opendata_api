class CreateLocationsTable < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :address
      t.string :postcode
      t.string :notes
    end
  end

  def down
    drop_table :locations
  end
end
