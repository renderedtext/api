# API

## Setup

```
./scripts/setup
```

## Generate an Entity

``` sh
./scripts/generate <entity_name>
```

### Example

To generate a user entity type the following:

``` sh
$ ./scripts/generate user

Generated entity - schema/schemata/user.yml
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

-**NOTE:** To only serve static files you can run `./scripts/server`

## Conventions

### Entry properties

  - Attributes which ends with `*_url` should point to API actions
  - Attributes which ends with `*_html_url` should point to pages in application

### Entry actions

  - Please sort entry actions (links) in the following order:
    - entry attributes
    - nested entries
    - urls
    - dates

  - Mark not implemented API actions with `✖` at the end of action name

