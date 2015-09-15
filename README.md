# API

- [Projects](projects.md)
- [Threads](threads.md)
- [Test Boosters](test_boosters.md)
- [Test Booster Options](test_booster_options.md)

# General Guidelines

- This is an internal API and every endpoint should be prefixed with:

```
https://semaphoreci.com/api/internal/
```

- Every project related entity should be nested under the owner/project endpoint:

```
https://sempahoreci.com/api/internal/:owner/:project_name/
```

- Aim to create new project related Entities in the root path of
the owner/project endpoint.

Good example for adding a Build and a Thread entity:

```
/:owner/:project_name/builds
```

```
/:owner/:project_name/threads
```

Bad example for adding a Build and a Thread entity:

```
/:owner/:project_name/builds
```

```
/:owner/:project_name/builds/:id/threads
```

By following the above example we can keep the owner/project namespace flat and
simple.

GitHub uses a similar approach for their [Repositories API endpoint](https://developer.github.com/v3/repos/).

Heroku uses a similar approach for their [Platform API](https://devcenter.heroku.com/articles/platform-api-reference).

# References and Inspiration

- [API Design Methodology](http://www.infoq.com/presentations/api-design-methodology)
- [Interview with Amundsen](http://www.infoq.com/interviews/amundsen-api)
- [REST API Design Rulebook](http://shop.oreilly.com/product/0636920021575.do)
- [RESTful Web Services Cookbook - Solutions for Improving Scalability and Simplicity](http://shop.oreilly.com/product/9780596801694.do)
- [RESTful Web APIs](http://shop.oreilly.com/product/0636920028468.do)
