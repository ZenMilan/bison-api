## Bison API

A simple, lightweight API behind [Bison](https://github.com/pruett/bison)

**GET** `/api/campaigns`

Returns all campaigns

`{ campaigns: '...', '...' }`

**GET** `/api/campaigns/:id`

Fetches one specific campaign by `:id`

`{ campaigns: '...' }`

**GET** `/api/campaigns/:location`

Returns all campaigns in a particular `:location`

`{ campaigns: '...' }`

**POST** `/api/campaigns`

Adds a campaign, returns its `id`

`{ campaigns: 'id : ...' }`