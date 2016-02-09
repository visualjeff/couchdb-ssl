Project is a Nginx/CouchDB deployable docker composition:

  * Nginx 1.9.9-1~jessie
  * Couchdb 1.6.1
  * Debian linux jessie
  * Docker 1.9.1
  * Docker-compose 

Two docker images are produced:
  1. Nginx and CouchDB
  2. Docker Data Volumn

The Nginx/CouchDB image size is roughly about 230mb +/-
The Docker data volumn image size is 1mb +/-

To build the docker composition:
```
  docker-compose build
```

For setting up communication between containers use the **--x-networking** option.  This is a new feature of docker-compose that replaces links. It setups up networks so that containers can communicate with one another.

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
  curl -kX GET https://localhost/_all_dbs
```

To view the CouchDB Futon UI:
```
  https://localhost/_utils/
```

Credentials for the administration account is:  
```
admin:Happy4u$
```

To create a database:
```
  curl -u admin:<password> -kX PUT https://localhost/<database_name>
```

To POST data to a database:
```
  curl -H 'Content-Type: application/json' -u admin:<password> -kX POST https://localhost/test -d '{"name": "test name"}'
```

To GET a particular record:
```
  curl -kX GET https://localhost/test/<record_id>
```

To PUT a design document for a view:
```
  curl -u admin:<password> -kX PUT https://localhost/<database>/_design/<view_name> -d sample.json
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

To turn on replication between nodes see:

[https://sites.google.com/a/costco.com/javascript-users-group/home/tools/nosql/couchdb/replication](https://sites.google.com/a/costco.com/javascript-users-group/home/tools/nosql/couchdb/replication "CouchDB Replication")
