# Braches API

- [Attributes](#attributes)
- [List all branches on a project](#list-all-branches-on-a-project)
- [Get a single branch](#get-a-single-branch)

## Attributes

Name          | Type                                      | Description
------------- | ------------------------------------------|------------------------
id            | UUID                                      | Hash ID of the branch.
url           | Link                                      | Link to the branch.
created_at    | DateTime                                  | Creation time.

## List all branches on a project

List all Braches.

```
GET /api/internal/:owner/:project/branches
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/branches/de305d54-75b4-431b-adb2-eb6b9e546014",
    "created_at": "2012-01-01T12:00:00Z",
    "builds_url": "https://semaphoreci.com/renderedtext/semaphore/branches/de305d54-75b4-431b-adb2-eb6b9e546014/builds"
  }
]
```

## Get a single branch

```
GET /api/internal/:owner/:project/branches/:id
```

### Response

`Status: 200 OK`

``` json
{
  "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
  "url": "https://semaphoreci.com/renderedtext/semaphore/branches/de305d54-75b4-431b-adb2-eb6b9e546014",
  "created_at": "2012-01-01T12:00:00Z",
  "builds_url": "https://semaphoreci.com/renderedtext/semaphore/branches/de305d54-75b4-431b-adb2-eb6b9e546014/builds"
}
```
