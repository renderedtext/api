# ThreadConfigs API

- [Attributes](#attributes)
- [Index](#index)
- [Get](#get)
- [Create](#create)
- [Edit](#edit)
- [Delete](#delete)

## Attributes

Name          | Type                                   | Description
------------- | ---------------------------------------|--------------
id            | UUID                                   | Id of a thread config.
url           | Link                                   | Link to a thread config.
type          | "setup", "build_thread", "post_thread" | Type of thread.
created_at    | DateTime                               | Creation time.
updated_at    | DateTime                               | Update time.
commands      | [string]                               | List of commands.

## Index

List all ThreadConfigs for the project.

```
GET /api/internal/:owner/:project/thread_configs
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": 9383,
    "name": "RSpec 123/123",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/thread_configs/9383",
    "type": "build_thread",
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z",
    "commands": [
      "bundle exec rspec",
      "bundle exec rpsec4"
    ]
  },
  {
    "id": 23423,
    "name": "Setup",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/thread_configs/23423",
    "type": "setup",
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z",
    "commands": [
      "env",
      "bundle install"
    ]
  },
  {
    "id": 2323,
    "name": "Post-thread",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/thread_configs/2323",
    "type": "post_thread",
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z",
    "commands": [
      "some_code_coverage",
      "aws s3 cp x s3://nesto/x.bmp"
    ]
  }
]
```

## Get

```
GET /api/internal/:owner/:project/thread_configs/:id
```
### Response

`Status: 200 OK`

```json
{
    "id": 2323,
    "name": "Post-thread",
    "type": "post_thread",
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z",
    "commands": [
      "some_code_coverage",
      "aws s3 cp x s3://nesto/x.bmp"
    ]
  }
```

## Create

```
POST /api/internal/:owner/:project/thread_configs
```

### Input

Name          | Type         | Description
------------- | -------------|--------------
name          | string       | _Required_ Name of your thread
type          | string       | _Required_ Type of thread. Valid options are `setup`, `build_thread`, `post_thread`
commands      | array        | _Required_ Array of commands.

#### Example

```json
{
  "name": "Rspec 2/4",
  "type": "build_thread",
  "commands": [
    "bundle install",
    "bundle exec rspec
  ]
}
```

### Response

#### Status code and headers

```
Status: 201 Created
Location: https://semaphoreci.com/api/internal/renderedtext/semaphore_front/123
```

#### Body
```json
{
    "id": 123,
    "name": "Rspec 2/4",
    "type": "build_thread",
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z",
    "commands": [
      "some_code_coverage",
      "aws s3 cp x s3://nesto/x.bmp"
    ]
}
```

## Edit

```
PATCH /api/internal/:owner/:project/thread_configs/:id
```

### Input

Name          | Type         | Description
------------- | -------------|--------------
name          | string       | _Required_ Name of your thread
type          | string       | _Required_ Type of thread. Valid options are `setup`, `build_thread`, `post_thread`
commands      | array        | _Required_ Array of commands.

#### Example

```json
{
  "name": "Rspec 2/4",
  "type": "build_thread",
  "commands": [
    "bundle install",
    "bundle exec rspec"
  ]
}
```

### Response

#### Status code and headers

```
Status: 200 OK
```

#### Body
```json
{
    "id": 123,
    "name": "Post-thread",
    "type": "post_thread",
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z",
    "commands": [
      "bundle install",
      "bundle exec rspec"
    ]
}
```

## Delete

```
DELETE /api/internal/:owner/:project/thread_configs/:id
```

### Response

#### Status code and headers

```
Status: 204 No Content
```
