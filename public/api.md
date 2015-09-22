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


## <a name="resource-thread_config"></a>ThreadConfig

A ThreadConfig represents a list of commands that will be used for future builds.

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **id** | *uuid* | unique identifier of thread_config | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | name of thread_config | `"Rspec 2/4"` |
| **url** | *string* | a link to the thread_config | `"https://semaphoreci.com/api/internal/renderedtext/semaphore/thread_configs{/id}"` |
| **type** | *string* | Type of a thread.<br/> **one of:**`"setup"` or `"thread"` or `"post_thread"` | `"setup"` |
| **commands** | *string* | A list of commands that define a thread configuration. | `["sudo apt-get install wget -y","bundle exec rake:spec"]` |
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
| **type** | *string* | Type of a thread.<br/> **one of:**`"setup"` or `"thread"` or `"post_thread"` | `"setup"` |
| **commands** | *string* | A list of commands that define a thread configuration. | `["sudo apt-get install wget -y","bundle exec rake:spec"]` |



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
| **type** | *string* | Type of a thread.<br/> **one of:**`"setup"` or `"thread"` or `"post_thread"` | `"setup"` |
| **commands** | *string* | A list of commands that define a thread configuration. | `["sudo apt-get install wget -y","bundle exec rake:spec"]` |



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


