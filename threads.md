# Threads API

- [Attributes](#attributes)
- [List all threads on a project](#list-threads-on-a-project)
- [Get a single thread](#get-a-single-thread)
- [List all threads on a build](#list-all-threads-on-a-build)

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
parent_url    | Link                                      | Link to a build or a deploy.
commands_url  | Link                                      | Link to thread commands.
commands      | [Command]                                 | List of commands.

## List threads on a project

```
GET /api/internal/:owner/:project/threads
```

### Input

Name                | Type    | Description
------------------- | --------|------------------------
with_command_output | boolean | _optional_ Default value is `false`.

### Response

`Status: 200 OK`

```json
[
  {
    "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/threads/de305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "queued",
    "result": null,
    "created_at": "2012-01-01T12:00:00Z",
    "started_at": null,
    "finished_at": null,
    "parent_url": "https://semaphoreci.com/renderedtext/semaphore/builds/9e305d54-75b4-431b-adb2-eb6b9e546014",
    "commands_url": "https://semaphoreci.com/renderedtext/semaphore/threads/de305d54-75b4-431b-adb2-eb6b9e546014/commands",
    "commands" : [
      {
        "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
        "url": "https://semaphoreci.com/renderedtext/semaphore/commands/de305d54-75b4-431b-adb2-eb6b9e546014",
        "type": "thread",
        "status": "finished",
        "result": "stopped",
        "output": nil,
        "started_at": "2012-01-01T12:00:00Z",
        "finished_at": "2012-01-01T12:00:00Z",
        "thread_url": "https://semaphoreci.com/renderedtext/semaphore/threads/de305d54-75b4-431b-adb2-eb6b9e546014"
      }
    ]
  }
]
```

## Get a single thread

```
GET /api/internal/:owner/:project/threads/:id
```

### Input

Name                | Type    | Description
------------------- | --------|------------------------
with_command_output | boolean | _optional_ Default value is `false`.

### Response

`Status: 200 OK`

``` json
{
  "id": "ce305d54-75b4-431b-adb2-eb6b9e546014",
  "url": "https://semaphoreci.com/renderedtext/semaphore/threads/ce305d54-75b4-431b-adb2-eb6b9e546014",
  "status": "finished",
  "status": "failed",
  "created_at": "2012-01-01T12:00:00Z",
  "started_at": "2012-01-01T12:00:00Z",
  "finished_at": "2012-01-01T12:00:00Z",
  "parent_url": "https://semaphoreci.com/renderedtext/semaphore/builds/9e305d54-75b4-431b-adb2-eb6b9e546014",
  "commands_url": "https://semaphoreci.com/renderedtext/semaphore/threads/de305d54-75b4-431b-adb2-eb6b9e546014/commands",
  "commands" : [
    {
      "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
      "url": "https://semaphoreci.com/renderedtext/semaphore/commands/de305d54-75b4-431b-adb2-eb6b9e546014",
      "type": "thread",
      "status": "finished",
      "result": "stopped",
      "output": nil,
      "started_at": "2012-01-01T12:00:00Z",
      "finished_at": "2012-01-01T12:00:00Z",
      "thread_url": "https://semaphoreci.com/renderedtext/semaphore/threads/de305d54-75b4-431b-adb2-eb6b9e546014"
    }
  ]
}
```

## List all threads on a build

```
GET /api/internal/:owner/:project/builds/:id/threads
```

### Input

Name                | Type    | Description
------------------- | --------|------------------------
with_command_output | boolean | _optional_ Default value is `false`.

### Response

`Status: 200 OK`

```json
[
  {
    "id": "ce305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/threads/ce305d54-75b4-431b-adb2-eb6b9e546014",
    "status": "finished",
    "status": "failed",
    "created_at": "2012-01-01T12:00:00Z",
    "started_at": "2012-01-01T12:00:00Z",
    "finished_at": "2012-01-01T12:00:00Z",
    "parent_url": "https://semaphoreci.com/renderedtext/semaphore/builds/9e305d54-75b4-431b-adb2-eb6b9e546014",
    "commands_url": "https://semaphoreci.com/renderedtext/semaphore/threads/de305d54-75b4-431b-adb2-eb6b9e546014/commands"
    "commands" : [
      {
        "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
        "url": "https://semaphoreci.com/renderedtext/semaphore/commands/de305d54-75b4-431b-adb2-eb6b9e546014",
        "type": "thread",
        "status": "finished",
        "result": "stopped",
        "output": nil,
        "started_at": "2012-01-01T12:00:00Z",
        "finished_at": "2012-01-01T12:00:00Z",
        "thread_url": "https://semaphoreci.com/renderedtext/semaphore/threads/de305d54-75b4-431b-adb2-eb6b9e546014"
      }
    ]
  }
]
```
