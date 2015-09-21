# API

## Setup

```
bundle install --path vendor/bundle
```

## Generate an Entity

``` sh
./generate <entity_name>
```

### Example

To generate a user entity type the following:

``` sh
$ ./generate user

Generated entity - schema/schemata/user.yml
```

## Schema

You can generate your schema by executing:

```
bundle exec rake api:schema:generate
```

## Generating HTML and Markdown documentation

To generate a Markdown documentation execute:

```
bundle exec rake api:schema:doc
```

To generate a HTML documentation execute:

```
bundle exec rake api:html:render
```

After generation the documents could be found in `public/`.

**NOTE:** `api:html:render` will also generate a Markdown document.
