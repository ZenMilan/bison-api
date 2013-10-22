## Bison API

A simple, lightweight, Sinatra JSON API powering [Bison](https://github.com/pruett/bison)

Data is persisted via MongoDB, accessed through the [Mongo Ruby Driver](https://github.com/mongodb/mongo-ruby-driver) 

**GET** `/api/campaigns`

*Returns all campaigns*

**GET** `/api/campaigns/:id`

*Fetches one specific campaign by `:id`*

**GET** `/api/campaigns/:location`

*Returns all campaigns in a particular `:location`*

**POST** `/api/campaigns`

*Adds a campaign, returns its `id`*
