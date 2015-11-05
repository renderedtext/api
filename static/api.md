## <a name="resource-branch"></a>Branch

Represents a branch.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of branch | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **url** | *string* | a link to the branch | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/build/id"` |
| **project_url** | *string* | a link to the project | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/projects/{project_id}"` |
| **name** | *string* | name of branch | `"example"` |
| **created_at** | *date-time* | when branch was created | `"2015-01-01T12:00:00Z"` |
| **updated_at** | *date-time* | when branch was updated | `"2015-01-01T12:00:00Z"` |

### Branch Info

Info for existing branch.

```
GET /{owner_id}/{project_id}/branches/{branch_id}
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/branches/$BRANCH_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/build/id",
  "project_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/projects/{project_id}",
  "name": "example",
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### Branch List

List existing branches.

```
GET /{owner_id}/{project_id}/branches
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/branches
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/build/id",
    "project_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/projects/{project_id}",
    "name": "example",
    "created_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```


## <a name="resource-build"></a>Build

Represents a build.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when build was created | `"2015-01-01T12:00:00Z"` |
| **id** | *uuid* | unique identifier of build | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **url** | *string* | a link to the build | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}"` |
| **status** | *string* | status of the build<br/> **one of:**`"queued"` or `"running"` or `"finished"` | `"queued"` |
| **result** | *string* | Type of a thread<br/> **one of:**`"failed"` or `"passed"` or `"stopped"` or `"canceled"` | `"failed"` |
| **started_at** | *date-time* | when build was started | `"2015-01-01T12:00:00Z"` |
| **finished_at** | *date-time* | when build was finished | `"2015-01-01T12:00:00Z"` |
| **updated_at** | *date-time* | when build was updated | `"2015-01-01T12:00:00Z"` |
| **threads_url** | *string* | a link to build's threads | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/builds/{build_id}/threads"` |
| **branch_url** | *string* | a link to build's branch | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/branches/{branch_id}"` |

### Build Create

Create a new build.

```
POST /{owner_id}/{project_id}/builds
```


#### Curl Example

```bash
$ curl -n -X POST https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/builds \
  -H "Content-Type: application/json" \
 \
  -d '{
}'
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}",
  "status": "queued",
  "result": "failed",
  "started_at": "2015-01-01T12:00:00Z",
  "finished_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z",
  "threads_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds/{build_id}/threads",
  "branch_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/branches/{branch_id}"
}
```

### Build Info

Info for existing build.

```
GET /{owner_id}/{project_id}/builds/{build_id}
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/builds/$BUILD_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}",
  "status": "queued",
  "result": "failed",
  "started_at": "2015-01-01T12:00:00Z",
  "finished_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z",
  "threads_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds/{build_id}/threads",
  "branch_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/branches/{branch_id}"
}
```

### Build List

List existing builds.

```
GET /{owner_id}/{project_id}/builds
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/builds
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "created_at": "2015-01-01T12:00:00Z",
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}",
    "status": "queued",
    "result": "failed",
    "started_at": "2015-01-01T12:00:00Z",
    "finished_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z",
    "threads_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds/{build_id}/threads",
    "branch_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/branches/{branch_id}"
  }
]
```

### Build List for Branch

List existing builds on a branch.

```
GET /{owner_id}/{project_id}/branches/{branch_id}/builds
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/branches/$BRANCH_ID/builds
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "created_at": "2015-01-01T12:00:00Z",
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}",
    "status": "queued",
    "result": "failed",
    "started_at": "2015-01-01T12:00:00Z",
    "finished_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z",
    "threads_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds/{build_id}/threads",
    "branch_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/branches/{branch_id}"
  }
]
```


## <a name="resource-command"></a>Command

Represents a command

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of command | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **url** | *string* | a link to the command | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/commands{/id}"` |
| **type** | *string* | Type of a command.<br/> **one of:**`"setup"` or `"build_thread"` or `"post_thread"` | `"setup"` |
| **status** | *string* | status of the command<br/> **one of:**`"pending"` or `"running"` or `"finished"` | `"queued"` |
| **result** | *string* | command result<br/> **one of:**`"failed"` or `"passed"` or `"stopped"` or `"canceled"` | `"failed"` |
| **exit_status** | *number* | command result | `0` |
| **thread_url** | *string* | a link to the thread that contains the command | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands"` |
| **started_at** | *date-time* | when command was started | `"2015-01-01T12:00:00Z"` |
| **finished_at** | *date-time* | when command was finished | `"2015-01-01T12:00:00Z"` |

### Command Info

Info for existing command.

```
GET /{owner_id}/{project_id}/commands/{command_id}
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/commands/$COMMAND_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/commands{/id}",
  "type": "setup",
  "status": "queued",
  "result": "failed",
  "exit_status": 0,
  "thread_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
  "started_at": "2015-01-01T12:00:00Z",
  "finished_at": "2015-01-01T12:00:00Z"
}
```

### Command List

List existing commands.

```
GET /{owner_id}/{project_id}/commands
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **with_output** | *boolean* | should the command output be included - default is false | `"true"` |


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/commands
 -G \
  -d with_output=true
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/commands{/id}",
    "type": "setup",
    "status": "queued",
    "result": "failed",
    "exit_status": 0,
    "thread_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
    "started_at": "2015-01-01T12:00:00Z",
    "finished_at": "2015-01-01T12:00:00Z"
  }
]
```

### Command List for Thread

List commands for a thread.

```
GET /{owner_id}/{project_id}/threads/{thread_id}/commands
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **with_output** | *boolean* | should the command output be included - default is false | `"true"` |


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/threads/$THREAD_ID/commands
 -G \
  -d with_output=true
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/commands{/id}",
    "type": "setup",
    "status": "queued",
    "result": "failed",
    "exit_status": 0,
    "thread_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
    "started_at": "2015-01-01T12:00:00Z",
    "finished_at": "2015-01-01T12:00:00Z"
  }
]
```


## <a name="resource-deploy"></a>Deploy

Represents a deploy.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of deploy | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **url** | *string* | a link to the deploy | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/deploys{/id}"` |
| **created_at** | *date-time* | when deploy was created | `"2015-01-01T12:00:00Z"` |
| **started_at** | *date-time* | when deploy was created | `"2015-01-01T12:00:00Z"` |
| **finished_at** | *date-time* | when deploy was created | `"2015-01-01T12:00:00Z"` |
| **updated_at** | *date-time* | when deploy was updated | `"2015-01-01T12:00:00Z"` |

### Deploy from build

Deploy a build.

```
POST /{owner_id}/{project_id}/builds/{build_id}/deploys
```


#### Curl Example

```bash
$ curl -n -X POST https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/builds/$BUILD_ID/deploys \
  -H "Content-Type: application/json" \
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/deploys{/id}",
    "created_at": "2015-01-01T12:00:00Z",
    "started_at": "2015-01-01T12:00:00Z",
    "finished_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```

### Deploy Info

Info for existing deploy.

```
GET /{owner_id}/{project_id}/deploys/{deploy_id}
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/deploys/$DEPLOY_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/deploys{/id}",
  "created_at": "2015-01-01T12:00:00Z",
  "started_at": "2015-01-01T12:00:00Z",
  "finished_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### Deploy List

List existing deploys.

```
GET /{owner_id}/{project_id}/deploys
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/deploys
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/deploys{/id}",
    "created_at": "2015-01-01T12:00:00Z",
    "started_at": "2015-01-01T12:00:00Z",
    "finished_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```


## <a name="resource-owner"></a>Owner

An Owner represents the owner of a project on SemaphoreCI.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of owner | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | unique name of owner | `"renderedtext"` |
| **created_at** | *date-time* | when owner was created | `"2015-01-01T12:00:00Z"` |
| **updated_at** | *date-time* | when owner was updated | `"2015-01-01T12:00:00Z"` |


## <a name="resource-project"></a>Project

A Project represents a project on SemaphoreCI.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of project | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | unique name of project | `"semaphore"` |
| **created_at** | *date-time* | when project was created | `"2015-01-01T12:00:00Z"` |
| **updated_at** | *date-time* | when project was updated | `"2015-01-01T12:00:00Z"` |


## <a name="resource-test_booster"></a>TestBooster

A TestBooster represents configuration which will be used to parallelize test suite

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of test_booster | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | name of test_booster | `"Rspec"` |
| **url** | *string* | a link to the test_booster | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/test_boosters{/id}"` |
| **type** | *string* | type of Test Booster<br/> **one of:**`"rspec"` or `"cucumber"` | `"rspec"` |
| **size** | *integer* | size of Test Booster | `42` |
| **created_at** | *date-time* | when test_booster was created | `"2015-01-01T12:00:00Z"` |
| **updated_at** | *date-time* | when test_booster was updated | `"2015-01-01T12:00:00Z"` |

### TestBooster Create

Create a new test_booster.

```
POST /{owner_id}/{project_id}/test_boosters
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **type** | *string* | type of Test Booster<br/> **one of:**`"rspec"` or `"cucumber"` | `"rspec"` |
| **size** | *integer* | size of Test Booster | `42` |



#### Curl Example

```bash
$ curl -n -X POST https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/test_boosters \
  -H "Content-Type: application/json" \
 \
  -d '{
  "type": "rspec",
  "size": 42
}'
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "Rspec",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/test_boosters{/id}",
  "type": "rspec",
  "size": 42,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### TestBooster Delete

Delete an existing test_booster.

```
DELETE /{owner_id}/{project_id}/test_boosters/{test_booster_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/test_boosters/$TEST_BOOSTER_ID \
  -H "Content-Type: application/json" \
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "Rspec",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/test_boosters{/id}",
  "type": "rspec",
  "size": 42,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### TestBooster Info

Info for existing test_booster.

```
GET /{owner_id}/{project_id}/test_boosters/{test_booster_id}
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/test_boosters/$TEST_BOOSTER_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "Rspec",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/test_boosters{/id}",
  "type": "rspec",
  "size": 42,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### TestBooster List

List existing test_boosters.

```
GET /{owner_id}/{project_id}/test_boosters
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/test_boosters
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "name": "Rspec",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/test_boosters{/id}",
    "type": "rspec",
    "size": 42,
    "created_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```

### TestBooster Update

Update an existing test_booster.

```
PATCH /{owner_id}/{project_id}/test_boosters/{test_booster_id}
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **type** | *string* | type of Test Booster<br/> **one of:**`"rspec"` or `"cucumber"` | `"rspec"` |
| **size** | *integer* | size of Test Booster | `42` |



#### Curl Example

```bash
$ curl -n -X PATCH https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/test_boosters/$TEST_BOOSTER_ID \
  -H "Content-Type: application/json" \
 \
  -d '{
  "type": "rspec",
  "size": 42
}'
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "Rspec",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/test_boosters{/id}",
  "type": "rspec",
  "size": 42,
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```


## <a name="resource-thread"></a>Thread

Represents a Thread

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of thread | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | name of thread | `"example"` |
| **url** | *string* | a link to the build | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/threads{/id}"` |
| **parent_url** | *string* | a link to the parent of the thread | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}"` |
| **commands_url** | *string* | a link to the parent of the thread | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands"` |
| **created_at** | *date-time* | when thread was created | `"2015-01-01T12:00:00Z"` |
| **started_at** | *date-time* | when thread was started | `"2015-01-01T12:00:00Z"` |
| **finished_at** | *date-time* | when thread was finished | `"2015-01-01T12:00:00Z"` |
| **updated_at** | *date-time* | when thread was updated | `"2015-01-01T12:00:00Z"` |

### Thread Info

Info for existing thread.

```
GET /{owner_id}/{project_id}/threads/{thread_id}
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/threads/$THREAD_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads{/id}",
  "parent_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}",
  "commands_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
  "commands": [
    {
      "id": "01234567-89ab-cdef-0123-456789abcdef",
      "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/commands{/id}",
      "type": "setup",
      "status": "queued",
      "result": "failed",
      "exit_status": 0,
      "thread_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
      "started_at": "2015-01-01T12:00:00Z",
      "finished_at": "2015-01-01T12:00:00Z"
    }
  ],
  "created_at": "2015-01-01T12:00:00Z",
  "started_at": "2015-01-01T12:00:00Z",
  "finished_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### Thread List

List existing threads.

```
GET /{owner_id}/{project_id}/threads
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **with_command_output** | *boolean* | should the command output be included - default is false | `"true"` |


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/threads
 -G \
  -d with_command_output=true
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "name": "example",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads{/id}",
    "parent_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}",
    "commands_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
    "commands": [
      {
        "id": "01234567-89ab-cdef-0123-456789abcdef",
        "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/commands{/id}",
        "type": "setup",
        "status": "queued",
        "result": "failed",
        "exit_status": 0,
        "thread_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
        "started_at": "2015-01-01T12:00:00Z",
        "finished_at": "2015-01-01T12:00:00Z"
      }
    ],
    "created_at": "2015-01-01T12:00:00Z",
    "started_at": "2015-01-01T12:00:00Z",
    "finished_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```

### Thread for Build

List threads for a build.

```
GET /{owner_id}/{project_id}/builds/{build_id}/threads
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **with_command_output** | *boolean* | should the command output be included - default is false | `"true"` |


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/builds/$BUILD_ID/threads
 -G \
  -d with_command_output=true
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "name": "example",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads{/id}",
    "parent_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}",
    "commands_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
    "commands": [
      {
        "id": "01234567-89ab-cdef-0123-456789abcdef",
        "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/commands{/id}",
        "type": "setup",
        "status": "queued",
        "result": "failed",
        "exit_status": 0,
        "thread_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
        "started_at": "2015-01-01T12:00:00Z",
        "finished_at": "2015-01-01T12:00:00Z"
      }
    ],
    "created_at": "2015-01-01T12:00:00Z",
    "started_at": "2015-01-01T12:00:00Z",
    "finished_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```

### Thread for Deploy

List threads for a deploy.

```
GET /{owner_id}/{project_id}/deploys/{deploy_id}/threads
```

#### Optional Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **with_command_output** | *boolean* | should the command output be included - default is false | `"true"` |


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/deploys/$DEPLOY_ID/threads
 -G \
  -d with_command_output=true
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "name": "example",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads{/id}",
    "parent_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/builds{/id}",
    "commands_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
    "commands": [
      {
        "id": "01234567-89ab-cdef-0123-456789abcdef",
        "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/commands{/id}",
        "type": "setup",
        "status": "queued",
        "result": "failed",
        "exit_status": 0,
        "thread_url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/threads/{thread_id}/commands",
        "started_at": "2015-01-01T12:00:00Z",
        "finished_at": "2015-01-01T12:00:00Z"
      }
    ],
    "created_at": "2015-01-01T12:00:00Z",
    "started_at": "2015-01-01T12:00:00Z",
    "finished_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```


## <a name="resource-thread_config"></a>ThreadConfig

A ThreadConfig represents a list of commands that will be used for future builds.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of thread_config | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | name of thread_config | `"Rspec 2/4"` |
| **url** | *string* | a link to the thread_config | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/thread_configs{/id}"` |
| **type** | *string* | Type of a thread.<br/> **one of:**`"setup"` or `"build_thread"` or `"post_thread"` | `"setup"` |
| **commands** | *array* | A list of commands that define a thread configuration. | `["sudo apt-get install wget -y","bundle exec rake:spec"]` |
| **created_at** | *date-time* | when thread_config was created | `"2015-01-01T12:00:00Z"` |
| **updated_at** | *date-time* | when thread_config was updated | `"2015-01-01T12:00:00Z"` |

### ThreadConfig List

List existing thread_configs.

```
GET /{owner_id}/{project_id}/thread_configs
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/thread_configs
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
[
  {
    "id": "01234567-89ab-cdef-0123-456789abcdef",
    "name": "Rspec 2/4",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/thread_configs{/id}",
    "type": "setup",
    "commands": [
      "sudo apt-get install wget -y",
      "bundle exec rake:spec"
    ],
    "created_at": "2015-01-01T12:00:00Z",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```

### ThreadConfig Delete

Delete an existing thread_config.

```
DELETE /{owner_id}/{project_id}/thread_configs/{thread_config_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/thread_configs/$THREAD_CONFIG_ID \
  -H "Content-Type: application/json" \
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "Rspec 2/4",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/thread_configs{/id}",
  "type": "setup",
  "commands": [
    "sudo apt-get install wget -y",
    "bundle exec rake:spec"
  ],
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### ThreadConfig Info

Info for existing thread_config.

```
GET /{owner_id}/{project_id}/thread_configs/{thread_config_id}
```


#### Curl Example

```bash
$ curl -n https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/thread_configs/$THREAD_CONFIG_ID
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "Rspec 2/4",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/thread_configs{/id}",
  "type": "setup",
  "commands": [
    "sudo apt-get install wget -y",
    "bundle exec rake:spec"
  ],
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### ThreadConfig Create

Create a new thread_config.

```
POST /{owner_id}/{project_id}/thread_configs
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **name** | *string* | name of thread_config | `"Rspec 2/4"` |
| **type** | *string* | Type of a thread.<br/> **one of:**`"setup"` or `"build_thread"` or `"post_thread"` | `"setup"` |
| **commands** | *array* | A list of commands that define a thread configuration. | `["sudo apt-get install wget -y","bundle exec rake:spec"]` |



#### Curl Example

```bash
$ curl -n -X POST https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/thread_configs \
  -H "Content-Type: application/json" \
 \
  -d '{
  "name": "Rspec 2/4",
  "type": "setup",
  "commands": [
    "sudo apt-get install wget -y",
    "bundle exec rake:spec"
  ]
}'
```


#### Response Example

```
HTTP/1.1 201 Created
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "Rspec 2/4",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/thread_configs{/id}",
  "type": "setup",
  "commands": [
    "sudo apt-get install wget -y",
    "bundle exec rake:spec"
  ],
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### ThreadConfig Update

Update an existing thread_config.

```
PATCH /{owner_id}/{project_id}/thread_configs/{thread_config_id}
```

#### Required Parameters

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **name** | *string* | name of thread_config | `"Rspec 2/4"` |
| **type** | *string* | Type of a thread.<br/> **one of:**`"setup"` or `"build_thread"` or `"post_thread"` | `"setup"` |
| **commands** | *array* | A list of commands that define a thread configuration. | `["sudo apt-get install wget -y","bundle exec rake:spec"]` |



#### Curl Example

```bash
$ curl -n -X PATCH https://semaphoreci.com/api/internal/$OWNER_ID/$PROJECT_ID/thread_configs/$THREAD_CONFIG_ID \
  -H "Content-Type: application/json" \
 \
  -d '{
  "name": "Rspec 2/4",
  "type": "setup",
  "commands": [
    "sudo apt-get install wget -y",
    "bundle exec rake:spec"
  ]
}'
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "Rspec 2/4",
  "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore/thread_configs{/id}",
  "type": "setup",
  "commands": [
    "sudo apt-get install wget -y",
    "bundle exec rake:spec"
  ],
  "created_at": "2015-01-01T12:00:00Z",
  "updated_at": "2015-01-01T12:00:00Z"
}
```


