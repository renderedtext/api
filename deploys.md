# Deploys API

- [Attributes](#attributes)
- [List all deploys on a project](#list-deploys-on-a-project)
- [Get a single deploy](#get-a-single-deploy)
- [List all deploys on a build](#list-all-deploys-on-a-build)
- [List all deploys on a server](#list-all-deploys-on-a-server)
- [Start a deploy on a build](#start-a-deploy-on-a-build)

## Attributes

Name          | Type                                      | Description
------------- | ------------------------------------------|------------------------
id            | UUID                                      | Hash ID of the thread.
url           | Link                                      | Link to a thread.
status        | "queued", "running", "finished"           | Thread status.
result        | "failed", "passed", "stopped", "canceled" | Thread result.
created_at    | DateTime                                  | Creation time.
started_at    | DateTime                                  | Start time of the thread.
finished_at   | DateTime                                  | Finish time of the thread.
build_url     | Link                                      | Link to a build that this deploy belongs to.
server_url    | Link                                      | Link to the server.

## List deploys on a project

```
GET /api/internal/:owner/:project/deploys
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/deploys/de305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "queued",
    "result": null,
    "created_at": "2012-01-01T12:00:00Z",
    "started_at": null,
    "finished_at": null,
    "build_url": "https://semaphoreci.com/renderedtext/semaphore/builds/9e305d54-75b4-431b-adb2-eb6b9e546014",
    "server_url": "https://semaphoreci.com/renderedtext/semaphore/servers/9e305d54-75b4-431b-adb2-eb6b9e546014"
  }
]
```

## Get a single deploy

```
GET /api/internal/:owner/:project/deploys/:id
```

### Response

`Status: 200 OK`

``` json
{
  "id": "ce305d54-75b4-431b-adb2-eb6b9e546014",
  "url": "https://semaphoreci.com/renderedtext/semaphore/deploys/ce305d54-75b4-431b-adb2-eb6b9e546014",
  "status": "finished",
  "status": "failed",
  "created_at": "2012-01-01T12:00:00Z",
  "started_at": "2012-01-01T12:00:00Z",
  "finished_at": "2012-01-01T12:00:00Z",
  "build_url": "https://semaphoreci.com/renderedtext/semaphore/builds/9e305d54-75b4-431b-adb2-eb6b9e546014",
  "server_url": "https://semaphoreci.com/renderedtext/semaphore/servers/9e305d54-75b4-431b-adb2-eb6b9e546014"
}
```

## List all deploys on a build

```
GET /api/internal/:owner/:project/build/:id/deploys
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": "ce305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/deploys/ce305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "finished",
    "status": "failed",
    "created_at": "2012-01-01T12:00:00Z",
    "started_at": "2012-01-01T12:00:00Z",
    "finished_at": "2012-01-01T12:00:00Z",
    "build_url": "https://semaphoreci.com/renderedtext/semaphore/builds/9e305d54-75b4-431b-adb2-eb6b9e546014",
    "server_url": "https://semaphoreci.com/renderedtext/semaphore/servers/9e305d54-75b4-431b-adb2-eb6b9e546014"
  }
]
```

## List all deploys on a server

```
GET /api/internal/:owner/:project/server/:id/deploys
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": "ce305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/deploys/ce305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "finished",
    "status": "failed",
    "created_at": "2012-01-01T12:00:00Z",
    "started_at": "2012-01-01T12:00:00Z",
    "finished_at": "2012-01-01T12:00:00Z",
    "build_url": "https://semaphoreci.com/renderedtext/semaphore/builds/9e305d54-75b4-431b-adb2-eb6b9e546014",
    "server_url": "https://semaphoreci.com/renderedtext/semaphore/servers/9e305d54-75b4-431b-adb2-eb6b9e546014"
  }
]
```

## Start a deploy on a build

```
POST /api/internal/:owner/:project/server/:id/deploys
```

### Input

Name          | Type   | Description
------------- | -------|------------------------
server_id     | UUID   | _required_ Hash of the server.

### Example

``` json
{
  "server_id": "9e305d54-75b4-431b-adb2-eb6b9e546014"
}
```

### Response

`Status: 201 CREATED`

```json
[
  {
    "id": "ce305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/deploys/ce305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "finished",
    "status": "failed",
    "created_at": "2012-01-01T12:00:00Z",
    "started_at": "2012-01-01T12:00:00Z",
    "finished_at": "2012-01-01T12:00:00Z",
    "build_url": "https://semaphoreci.com/renderedtext/semaphore/builds/9e305d54-75b4-431b-adb2-eb6b9e546014",
    "server_url": "https://semaphoreci.com/renderedtext/semaphore/servers/9e305d54-75b4-431b-adb2-eb6b9e546014"
  }
]
```
