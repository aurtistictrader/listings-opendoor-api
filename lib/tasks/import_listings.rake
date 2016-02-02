require 'csv'

namespace :csv do

  desc 'Import CSV Listings'
  task :import_listing => :environment do

    csv_file_path = 'db/import_data/listing-details.csv'

    CSV.foreach(csv_file_path) do |row|
      Listing.create!(
          {
              :id => row[0],
              :street => row[1],
              :status => row[2],
              :price => row[3],
              :bedrooms => row[4],
              :bathrooms => row[5],
              :sq_ft => row[6],
              :lat => row[7],
              :lng => row[8]
          }
      ) unless row[0] == 'id'
    end
  end
end