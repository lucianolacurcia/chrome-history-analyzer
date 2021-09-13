Run this before importing:

```
curl -XPUT "<elasticsearch server url>/<name of the index specified in docker-compose file>" -H 'Content-Type: application/json' -d'
{
  "mappings": {
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
  }
}'
```
