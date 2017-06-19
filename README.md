# API v2

Semaphore public API v2 - RAML specification

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
