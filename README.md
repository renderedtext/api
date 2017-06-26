# API v2

Semaphore public API v2 - RAML specification

## Where can you find the api specification?

Every time we merge into master, the new specification is pushed to S3. List the
S3 bucket to fetch the specification you need.

## Setting up a development environment

1. Install docker-compose:

``` bash
sudo pip install docker-compose
```

2. In the root of the project, type:

``` bash
docker-compose up
```

_note_: This will take a while the first time.

## Generating a JSON RAML spec

```
docker-compose run app scripts/compile
```
