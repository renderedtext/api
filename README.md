# API

While working on this API, you should consider how the end user would
interact with the endpoints.

## Setup

```
./scripts/setup
```

## Generate an Resource

``` sh
./scripts/generate <resource_name>
```

### Example

To generate a user entity type the following:

``` sh
$ ./scripts/generate user

Generated resource - schemata/user.yml
```

## Compiling Schema, HTML and Markdown documentation

You can generate your schema, html and markdown docs with:

```
$ ./scripts/compile
```

## Running a development server

While developing API specification guard will automatically regenerate Schema
for you on every change and restart server after it.

```
bundle exec guard
```

After starting server, documentation site can be found on port `3000`.

-**NOTE:** To only serve static files you can run `./scripts/server`

## Conventions

### Entity properties

  - Attributes which ends with `*_url` should point to API actions
  - Attributes which ends with `*_html_url` should point to pages in application

### Entity actions

  - Please sort entity actions (links) in the following order:
    - entity attributes
    - nested entities
    - urls
    - dates
