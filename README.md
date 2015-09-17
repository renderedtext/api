# API

- [Projects](projects.md)
- [Threads](threads.md)
- [Test Boosters](test_boosters.md)
- [Test Booster Options](test_booster_options.md)

## General Guidelines

- This is an internal API and every endpoint should be prefixed with:

```
https://semaphoreci.com/api/internal/
```

- Every project related entity should be nested under the owner/project endpoint:

```
https://sempahoreci.com/api/internal/:owner/:project_name/
```

## Resource relationship

Always aim to add project related entities without nesting them under
other entities. In practice, this means that every resource must have a
unique id, by which we can access it.

### Good example

[GitHub's Comments API](https://developer.github.com/v3/repos/comments/)

You can access a comment directly:

```
/repos/:owner/:repo/comments/:id
```

Also, you can access a comment via a commit:

```
/repos/:owner/:repo/commits/:ref/comments/:id
```

### Bad example

[Our public API for fetching Build Information](https://semaphoreci.com/docs/branches-and-builds-api.html#build_information).

You can *only* access information about a build if you
know the id of its branch and the number of the build.

```
/api/v1/projects/:hash_id/:id/builds/:number
```

### Conclusion

By following the above example we can keep the owner/project namespace flat and
simple.

GitHub uses a similar approach for their [Repositories API endpoint](https://developer.github.com/v3/repos/).

Heroku uses a similar approach for their [Platform API](https://devcenter.heroku.com/articles/platform-api-reference).


## Types of attributes

Every entity should have a defined list of attributes. For example, if you are
adding a User entity with (id, username, created_at) fields, you should provide
the following table:

Name          | Type                                   | Description
------------- | ---------------------------------------|--------------
id            | integer                                | Id of the user.
username      | string                                 | The username of the user.
created_at    | DateTime                               | Creation time.

The following list contains a list of recognized types for the attributes.

### Simple types

Type              | Description                                         | Example
------------------| ----------------------------------------------------| -------------
null              | JSON null value                                     |
boolean           | JSON boolean value                                  | true, false
integer           | JSON whole number value                             | 1, 2, 10, 10000
float             | JSON float number value                             | 1.12, 3.14
string            | JSON string                                         | "bob", "a nice dog"
"yellow", "black" | Enumeration. Not included values should be invalid. |
[type]            | Represents a list of a type.                        | [int], [string]

### Complex Types

Type              | Description                   | Example
------------------| ------------------------------| -------------
ID                | Represents an Entity's ID     | 1, 312, 90312
UUID              | Represents an Entity's UUID   | "de305d54-75b4-431b-adb2-eb6b9e546014"
Date              | Represents a Date             | "2015-09-15"
Time              | Represents a instance of Time | "08:58:18"
DateTime          | Represents a Date and a Time  | "2015-09-15 08:58:18 UTC"
Link              | Hypermedia link to a resource | "https://semaphoreci.com/api/internal/builds{/id}"

### Additional notes

- Always use underscores to define elements in an enumeration. In other words,
  use "post_thread" instead of "post-thread"

## References and Inspiration

- [API Design Methodology](http://www.infoq.com/presentations/api-design-methodology)
- [Interview with Amundsen](http://www.infoq.com/interviews/amundsen-api)
- [REST API Design Rulebook](http://shop.oreilly.com/product/0636920021575.do)
- [RESTful Web Services Cookbook - Solutions for Improving Scalability and Simplicity](http://shop.oreilly.com/product/9780596801694.do)
- [RESTful Web APIs](http://shop.oreilly.com/product/0636920028468.do)
