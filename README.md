# API v2

Semaphore public API v2 - RAML specification

- Currentlly, only documentation is generated (not the client).
- Initially, compleate specification will be in one file but over time
  it will be tamed (refactored).

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

3. Observe the API documentation in the browser:

``` bash
local.semaphore:8000
```

_note_: You don't need to manually build the docs if you use docker-compose.

## Generating a JSON RAML spec

```
docker-compose run app node scripts/output-json.js
```

## Building the docs

To setup tools:

``` bash
make setup
```

To generate documentation:

``` bash
make doc
```
