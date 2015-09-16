# Builds API

- [Attributes](#attributes)
- [List all builds on a project](#list-builds-on-a-project)
- [Get a single build](#get-a-single-build)
- [List all builds on a branch](#list-all-builds-on-a-branch)
- [Start a build on a branch](#start-a-build-on-a-branch)

## Attributes

Name          | Type                                      | Description
------------- | ------------------------------------------|------------------------
id            | UUID                                      | Hash ID of the build.
url           | Link                                      | Link to a build.
status        | "queued", "running", "finished"           | Build status.
result        | "failed", "passed", "stopped", "canceled" | Build result.
created_at    | DateTime                                  | Creation time.
started_at    | DateTime                                  | Start time of the build.
finished_at   | DateTime                                  | Finish time of the build.
branch_url    | Link                                      | Link to the branch.

## List builds on a project

```
GET /api/internal/:owner/:project/builds
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/builds/de305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "queued",
    "result": null,
    "created_at": "2012-01-01T12:00:00Z",
    "started_at": null,
    "finished_at": null,
    "branch_url": "https://semaphoreci.com/renderedtext/semaphore/branches/9e305d54-75b4-431b-adb2-eb6b9e546014",
  }
]
```

## Get a single build

```
GET /api/internal/:owner/:project/builds/:id
```

### Response

`Status: 200 OK`

``` json
{
  "id": "ce305d54-75b4-431b-adb2-eb6b9e546014",
  "url": "https://semaphoreci.com/renderedtext/semaphore/builds/ce305d54-75b4-431b-adb2-eb6b9e546014",
  "status": "finished",
  "result": "failed",
  "created_at": "2012-01-01T12:00:00Z",
  "started_at": "2012-01-01T12:00:00Z",
  "finished_at": "2012-01-01T12:00:00Z",
  "branch_url": "https://semaphoreci.com/renderedtext/semaphore/branches/9e305d54-75b4-431b-adb2-eb6b9e546014",
}
```

## List all builds on a branch

```
GET /api/internal/:owner/:project/branches/:id/builds
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/builds/de305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "queued",
    "result": null,
    "created_at": "2012-01-01T12:00:00Z",
    "started_at": null,
    "finished_at": null,
    "branch_url": "https://semaphoreci.com/renderedtext/semaphore/branches/9e305d54-75b4-431b-adb2-eb6b9e546014",
  }
]
```

## Start a build on a branch

```
POST /api/internal/:owner/:project/branches/:id/builds
```

### Response

`Status: 201 CREATED`

```json
{
  "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
  "url": "https://semaphoreci.com/renderedtext/semaphore/builds/de305d54-75b4-431b-adb2-eb6b9e546014",
  "status": "queued",
  "result": null,
  "created_at": "2012-01-01T12:00:00Z",
  "started_at": null,
  "finished_at": null,
  "branch_url": "https://semaphoreci.com/renderedtext/semaphore/branches/9e305d54-75b4-431b-adb2-eb6b9e546014",
}
```
