# Send your chrome's browsing history data to elasticsearch for analizing it!

This project was created for understanding how logstash, elasticsearch and kibana works, for sure MS Excel is more than enought for analizing and storing browsing data.

### Architecture
![](./arch.png)

To know where is located your hystory database loo at:
https://stackoverflow.com/questions/8936878/where-does-chrome-save-its-sqlite-database-to

Then create the index in Elastic:

```
curl -XPUT "<elasticsearch server url>/<name of the index specified in docker-compose file>" -H 'Content-Type: application/json' -d'
{
    "doc": {
      "properties": {
        "tiempo": {
          "type": "date",
          "format": "yyyy-MM-dd HH:mm:ss"
        },
        "visit_id": {
          "type": "long"
        },
        "terms": {
          "type": "text",
          "fielddata": true,
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "page_title": {
          "type": "text",
          "fielddata": true,
          "fields": {
            "keyword": {
              "type": "keyword",
              "ignore_above": 256
            }
          }
        },
        "url": {
          "type": "keyword"
        },
        "url_id": {
          "type": "long"
        }
      }
  }
}'
```
Then edit the docker-compose file and fill it with your data including the name of the just created index...
