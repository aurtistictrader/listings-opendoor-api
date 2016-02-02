# listings-api
Opendoor Engineering Problem

Requirements
---------------
At a minimum:
- Your API endpoint URL is /listings
- Your API responds with valid GeoJSON (you can check the output using http://geojson.io)
- Your API should correctly filter any combination of API parameters
- Use a datastore

Database Setup and Importing
---------------
1. I downloaded the csv data to ```db/import_data/listing-details.csv```

2. ``` rake db:create ```

3. ``` rake db:migrate ```

4. Imported the data with a custom rake task into the postgresql database: ``` rake csv:import_listing ```

5. ``` rails server ``` - to run locally

Demo
---------------
Using [heroku](http://chunky123-listings.herokuapp.com/listings)
