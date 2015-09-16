# Builds API

- [Attributes](#attributes)
- [Index](#index)
- [Get](#get)
- [Create](#create)
- [Edit](#edit)
- [Delete](#delete)

## Attributes

Name          | Type                                      | Description
------------- | ------------------------------------------|------------------------
id            | UUID                                      | Hash ID of the build.
url           | Link                                      | Link to a build.
status        | "queued", "running", "finished"           | Build status.
result        | "failed", "passed", "stopped", "canceled" | Build result.
created_at    | DateTime                                  | Creation time.
queued_at     | DateTime                                  | Queued time.
started_at    | DateTime                                  | Start time of the build.
finished_at   | DateTime                                  | Finish time of the build.

## Index

List all Builds.

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
    "status": null,
    "created_at": "2012-01-01T12:00:00Z",
    "queued_at": "2012-01-01T12:00:00Z",
    "started_at": null,
    "finished_at": null
  },
  {
    "id": "ge305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/builds/ge305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "running",
    "status": null,
    "created_at": "2012-01-01T12:00:00Z",
    "queued_at": "2012-01-01T12:00:00Z",
    "started_at": "2012-01-01T12:00:00Z",
    "finished_at": null
  },
  {
    "id": "ce305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/builds/ce305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "finished",
    "status": "failed",
    "created_at": "2012-01-01T12:00:00Z",
    "queued_at": "2012-01-01T12:00:00Z",
    "started_at": "2012-01-01T12:00:00Z",
    "finished_at": "2012-01-01T12:00:00Z",
  }
]
```

## Get

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
  "status": "failed",
  "created_at": "2012-01-01T12:00:00Z",
  "queued_at": "2012-01-01T12:00:00Z",
  "started_at": "2012-01-01T12:00:00Z",
  "finished_at": "2012-01-01T12:00:00Z",
}
```
