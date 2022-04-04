# tei-solr

## Start Solr

```
./bin/solr start -c -p 8983 -s example/cloud/node1/solr
./bin/solr start -c -p 7574 -s example/cloud/node2/solr -z localhost:9983
```

Then go to [admin UI](http://localhost:8983/solr/#/)

[Solr Tutorial](https://solr.apache.org/guide/8_11/solr-tutorial.html) is a good source of help.
How to create a collection:
```
./bin/solr create -c lat-misc -s 2 -rf 2
```

How to post docs for indexing:
```
./bin/post -c lat-misc ~/Documents
```

