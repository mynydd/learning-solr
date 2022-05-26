#!/bin/bash

solr_home=/home/paul/Downloads/solr-8.11.1

${solr_home}/bin/solr delete -c medieval

${solr_home}/bin/solr create -c medieval -s 2 -rf 2

curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"title", "type":"text_general", "multiValued":false, "stored":true}}' http://localhost:8983/solr/medieval/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"shelfmark", "type":"string", "multiValued":false, "stored":true}}' http://localhost:8983/solr/medieval/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"is_composite", "type":"boolean", "default":"false", "multiValued":false, "stored":true}}' http://localhost:8983/solr/medieval/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"is_part", "type":"boolean", "default":"false", "multiValued":false, "stored":true}}' http://localhost:8983/solr/medieval/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{ "add-copy-field":{ "source":"title", "dest":[ "_text_" ]} }' http://localhost:8983/solr/medieval/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{ "add-copy-field":{ "source":"shelfmark", "dest":[ "_text_" ]} }' http://localhost:8983/solr/medieval/schema

