# Learning Solr

## Basics
Start Solr: `./bin/solr start`

Stop solr: `./bin/solr stop`

Create a core: `./bin/solr create_core -c restaurants` or `cp -r ../solr-in-action/example-docs/ch8/cores/restaurants server/solr/`

Delete a core: `bin/solr delete -c restaurants` (or use Admin UI)

Post docs: `bin/post -c restaurants ../solr-in-action/example-docs/ch8/documents/restaurants.json`

[Admin UI](http://localhost:8983/solr/#/)

[Solr Tutorial](https://solr.apache.org/guide/8_11/solr-tutorial.html)

[Solr In Action](https://www.manning.com/books/solr-in-action)

## Facet
example:
```
http://localhost:8983/solr/restaurants/select?indent=true&q.op=OR&q=*%3A*&rows=0&facet=true&facet.field=tags&facet.field=state&f.state.facet.sort=index&f.tags.facet.limit=5
```


## Schema API
Get schema: `http://127.0.0.1:8983/solr/restaurants/schema`

or just the fields: `http://127.0.0.1:8983/solr/restaurants/schema/fields`

or the fieldtypes: ` http://127.0.0.1:8983/solr/restaurants/schema/fieldtypes`

Get config: `http://localhost:8983/solr/restaurants/config`
