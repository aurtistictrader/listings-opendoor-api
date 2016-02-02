# listings-api
Opendoor Engineering Problem

Requirements
---------------
At a minimum:
- Your API endpoint URL is /listings
- Your API responds with valid GeoJSON (you can check the output using http://geojson.io)
- Your API should correctly filter any combination of API parameters
- Use a datastore

Data Importing
---------------
1. I downloaded the csv data to ```db/import_data/listing-details.csv```

2. Imported the data with a custom rake task into the postgresql database: ``` rake csv:import_listing ```



