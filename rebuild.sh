#!/bin/bash
solr_home=/home/paul/Downloads/solr-8.11.1
${solr_home}/bin/solr delete -c medieval
${solr_home}/bin/solr create -c medieval -s 2 -rf 2
${solr_home}/bin/solr config -c medieval -p 7574 -action set-user-property -property update.autoCreateFields -value false
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"title", "type":"text_general", "multiValued":false, "stored":true}}' http://localhost:8983/solr/medieval/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"shelfmark", "type":"text_general", "multiValued":false, "stored":true}}' http://localhost:8983/solr/medieval/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"is_composite", "type":"boolean", "default":"false", "multiValued":false, "stored":true}}' http://localhost:8983/solr/medieval/schema
curl -X POST -H 'Content-type:application/json' --data-binary '{"add-field": {"name":"is_part", "type":"boolean", "default":"false", "multiValued":false, "stored":true}}' http://localhost:8983/solr/medieval/schema

