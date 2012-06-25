require 'csv'
require 'cartography'

namespace :publish do
  
  desc 'Import and publish Lambeth Location data'
  task :locations, [:filename, :category] => [:environment] do |task, args|
    
    file = File.join(Rails.root, "lib/data/locations/#{args[:filename]}")
    csv = CSV.read(file, encoding: "ISO8859-1", :headers => true)

    @category = Category.find_by_title(args[:category])
    if @category.nil?
        puts "Can not find category, do you need to create it first?"
        return
    end
      
    csv.each_with_index do |row, i|
      
      ll = Cartography.en_to_ll(row["Easting"].strip.to_f,row["Northing"].strip.to_f)
      name = row["Name"]
      latitude = ll[:latitude]
      longitude = ll[:longitude]
      
      if latitude && longitude && name

        # Ensure this isn't a duplicate row
        location = Location.where('name = ? and latitude = ? and longitude = ?', name.strip, latitude.to_s, longitude.to_s).first             
        if location.nil? 
          
          # Publish new location
          puts "Importing: #{name.strip} at #{latitude}, #{longitude}"
          location = Location.create! do |l|
            l.name = name.strip
            l.latitude = latitude
            l.longitude = longitude
            l.address = row["Address"] if row["Address"]
            l.postcode = row["Postcode"] if row["Postcode"]
            l.notes = row["Notes"] if row["Notes"]
          end
          location.category = @category
          location.save!
          
        else
          puts "Duplicate row; skipping."
        end
      else
        puts "Invalid row; skipping."
      end

    end
    
  end
  
  desc 'Import and publish Lambeth Expenditure data'
  task :expenses, [:filename] => [:environment] do |task, args|
    
    file = File.join(Rails.root, "lib/data/expenses/#{args[:filename]}")
    csv = CSV.read(file, encoding: "ISO8859-1")
      
    csv.each_with_index do |row, i|
      
      supplier = row[0]
      amount = row[1]
      date = row[2]
      
      # Hack to get date from filename, ideally the CSV should include this as row[2]
      #date_string = args[:filename].match(/([a-zA-Z]*)(500)(.*)\.csv/)
      #date = Date.parse(date_string[3])
     
      # Skip invalid rows
      if amount.present? && supplier.present? && supplier.strip != "Grand Total"
        
        amount = amount.gsub(/,/,'').gsub(/\u00A3/,'')
      
        # Ensure this isn't a duplicate expense
        expense = Expense.where('supplier = ? and amount = ? and date = ?', supplier.strip, amount.to_f, date).first             
        if expense.nil? && amount.to_i > 0
        
          # Publish new expense
          puts "Importing: #{amount} paid to #{supplier.strip}"
          expense = Expense.create! do |e|
            e.supplier = supplier.strip
            e.amount = amount
            e.date = date
          end
          expense.save!
        
        else
          puts "Duplicate expense detected; skipping"
        end
      else
        puts "Invalid expense detected; skipping"
      end
     
    end
    
  end
  
end