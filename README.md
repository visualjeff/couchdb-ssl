To build the docker composition:
```
  docker-compose build
```
To start all of the docker containers:
```
  docker-compose up -d
```

To confirm all of the docker containers are running:
```
  docker-compose ps
```

To stop all of the docker containers:
```
  docker-compose stop
```

To view all databases:
```
  curl -kX GET https://localhost:6984/_all_dbs
```

To create a database:
```
  curl -u admin:<password> -kX PUT https://localhost:6984/<database_name>
```

To POST data to a database:
```
  curl -H 'Content-Type: application/json' -u admin:<password> -kX POST https://localhost:6984/test -d '{"name": "test name"}'
```

To GET a particular record:
```
  curl -kX GET https://localhost:6984/test/<record_id>
```

To PUT a design document for a view:
```
  curl -u admin:<password> -kX PUT https://localhost:6984/<database>/_design/<view_name> -d sample.json
```

Sample.json file for adding a view:
```
  {
    "new_edits": false,
    "_id": "_design/<view_name>",
    "language": "javascript",
    "views": {
      "messages": {
        "map": "function(doc) { emit(doc._id, { 'sent': doc.headers.date[0], 'subject': doc.headers.subject[0] }); }"
      }
    }
  }
```
