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

First you should combine all your entities into one schema.json:

```
bundle exec rake api:schema:combine
```

This will create a JSON schema in `public/schema.json`.

After combining the schema, you should verify its validity:

```
bundle exec rake api:schema:verify
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
