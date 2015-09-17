# Commands API

- [Attributes](#attributes)
- [List all commands on a project](#list-commands-on-a-project)
- [Get a single command](#get-a-single-command)
- [List all commands on a thread](#list-all-commands-on-a-thread)

## Attributes

Name          | Type                                      | Description
------------- | ------------------------------------------|------------------------
id            | UUID                                      | Hash ID of the command.
url           | Link                                      | Link to a command.
type          | "setup", "thread", "post_thread"          | Type of the command.
status        | "pending", "running", "finished"          | Command status.
result        | "failed", "passed", "stopped", "canceled" | Command result.
output        | string                                    | Output of the command.
started_at    | DateTime                                  | Start time of the command.
finished_at   | DateTime                                  | Finish time of the command.
thread_url    | Link                                      | Link to the thread.

## List commands on a project

```
GET /api/internal/:owner/:project/commands
```

### Input

Name          | Type    | Description
------------- | --------|------------------------
with_output   | boolean | _optional_ Default value is `false`

### Response

`Status: 200 OK`

```json
[
  {
    "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/commands/de305d54-75b4-431b-adb2-eb6b9e546014",
    "type": "thread",
    "status": "finished",
    "result": "stopped",
    "output": null,
    "started_at": "2012-01-01T12:00:00Z",
    "finished_at": "2012-01-01T12:00:00Z",
    "thread_url": "https://semaphoreci.com/renderedtext/semaphore/threads/9e305d54-75b4-431b-adb2-eb6b9e546014"
  }
]
```

## Get a single command

```
GET /api/internal/:owner/:project/commands/:id
```

### Input

Name          | Type    | Description
------------- | --------|------------------------
with_output   | boolean | _optional_ Default value is `false`

### Response

`Status: 200 OK`

``` json
{
  "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
  "url": "https://semaphoreci.com/renderedtext/semaphore/commands/de305d54-75b4-431b-adb2-eb6b9e546014",
  "type": "thread",
  "status": "finished",
  "result": "stopped",
  "output": null,
  "started_at": "2012-01-01T12:00:00Z",
  "finished_at": "2012-01-01T12:00:00Z",
  "thread_url": "https://semaphoreci.com/renderedtext/semaphore/threads/9e305d54-75b4-431b-adb2-eb6b9e546014"
}
```

## List all commands on a thread

```
GET /api/internal/:owner/:project/threads/:id/commands
```

### Input

Name          | Type    | Description
------------- | --------|------------------------
with_output   | boolean | _optional_ Default value is `false`

### Response

`Status: 200 OK`

```json
[
  {
    "id": "de305d54-75b4-431b-adb2-eb6b9e546014",
    "url": "https://semaphoreci.com/renderedtext/semaphore/commands/de305d54-75b4-431b-adb2-eb6b9e546014",
    "type": "thread",
    "status": "finished",
    "result": "stopped",
    "output": null,
    "started_at": "2012-01-01T12:00:00Z",
    "finished_at": "2012-01-01T12:00:00Z",
    "thread_url": "https://semaphoreci.com/renderedtext/semaphore/threads/9e305d54-75b4-431b-adb2-eb6b9e546014"
  }
]
```
