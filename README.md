# Lambeth Open Data API

An API and publishing tool for Lambeth Open Data.

## Data types

In order to publish data to the API, they should be formatted as one of the following:

### 1. Data format: Locations

#### Publishing

Expects a CSV with header row and the following columns:

    Name [string], Address [string], Postcode [string], Notes [text], Easting [OSGB36], Northing [OSGB36]

    rake publish:locations[filename,category]

For example:

	rake publish:locations['LambethAdventurePlaygrounds.csv','Adventure Playgrounds']

#### API Endpoints

List all locations:

    /api/v1/locations

List locations by category:

    /api/v1/locations/category/1/

Show single location:

    /api/v1/locations/1

### 2. Data format: Expenses

#### Publishing

Expected format:

    supplier [string], amount [float], date [yyyy-mm-dd]
    
To import from CSV:

    rake publish:expenses[filename]

#### API Endpoints

List all expenses:

    /api/v1/expenses

Show single expense

	/api/v1/expenses/:id

Search expenses:

	/api/v1/expenses/search

	# Query params

    [string] supplier
    [date yyyy-mm-dd] from
    [date yyyy-mm-dd] to

	# For example:

    /api/v1/expenses/search?supplier=Group
    /api/v1/expenses/search?from=2011-04-01&to=2012-01-01
	/api/v1/expenses/search?from=2011-04-01&to=2012-01-01&supplier=Group

