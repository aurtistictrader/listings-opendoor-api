# listings-api
Opendoor Engineering Problem

Requirements
---------------
At a minimum:
- Your API endpoint URL is /listings
- Your API responds with valid GeoJSON (you can check the output using http://geojson.io)
- Your API should correctly filter any combination of API parameters
- Use a datastore

Routes
--------------
The route code for the controller is mainly in ```app/controllers/listings_controller.rb```

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

Possible Improvements
-----------------
* The listing index route does multiple filters on one object and stores everything in memory at '@listings'. This is not a really good because of extra memory and cpu usage. Ideally, this should be abstracted into simple ONE statement instead of multiple.

* There are no error feedback or responses for the api. When users enter an incorrect parameters, a better solution would be to use an appropriate response code like HTTP_BAD_REQUEST to identify that there are issues with the user's route and explain why.

* There aren't any unit tests - This is terrible practice in general, but I have left it out forn ow.

* If this API needs to be secure, there needs to be a certificate for https and specifics headers or signatures added to ensure the correct clients and servers are interacting correctly. This means sessions tokens might be passed back and forth.

* Everything is imported to CSV. It would be nice to have the rest of the routes completed - POST, PUT, DELETE. This makes data management more convenient.

* I didn't implement pagination - but that's definitely something that can be considered since there are a lot of listings, and sometimes the user might only want to top 10 or so.


