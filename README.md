
# Turbo Threads API

- [List project turbo threads](#list-project-threads)
- [Get](#get)
- [Create](#create)
- [Edit](#edit)
- [Delete](#delete)

## List project turbo threads

List all turbo threads for the project.

```
GET /api/internal/:owner/:project/turbo_threads
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": 9383,
    "type": "rspec",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/turbo_threads/9383",
    "size": 4,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  },
  {
    "id": 12,
    "type": "cucumber",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/turbo_threads/12",
    "size": 6,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```

## Get

```
GET /api/internal/:owner/:project/turbo_threads/:id
```
### Response

`Status: 200 OK`

```json
  {
    "id": 9383,
    "type": "rspec",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/turbo_threads/9383",
    "size": 4,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  }
```

## Create

```
POST /api/internal/:owner/:project/turbo_threads
```

### Input

Name          | Type         | Description
------------- | -------------|--------------
type          | string       | _Required_ Type of turbo thread. Valid options are `rspec` and `cucumber`
size          | number       | _Required_ Number of regular build threads to utilize.

#### Example

```json
  {
    "type": "rspec",
    "size": 4
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
    "id": 9383,
    "type": "rspec",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/turbo_threads/9383",
    "size": 4,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  }
```

## Edit

```
PATCH /api/internal/:owner/:project/turbo_threads/:id
```

### Input

Name          | Type         | Description
------------- | -------------|--------------
type          | string       | _Required_ Type of turbo thread. Valid options are `rspec` and `cucumber`
size          | number       | _Required_ Number of regular build threads to utilize.

#### Example

```json
  {
    "type": "rspec",
    "size": 4
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
    "id": 9383,
    "type": "rspec",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/turbo_threads/9383",
    "size": 4,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  }
```

## Delete

```
DELETE /api/internal/:owner/:project/turbo_threads/:id
```

### Response

#### Status code and headers

```
Status: 204 No Content
```

# Threads API

- [List project threads](#list-project-threads)
- [Get](#get)
- [Create](#create)
- [Edit](#edit)
- [Delete](#delete)

## List project threads

List all threads for the project.

```
GET /api/internal/:owner/:project/threads
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": 9383,
    "name": "RSpec 123/123",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/threads/9383",
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
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/threads/23423",
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
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/threads/2323",
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
GET /api/internal/:owner/:project/threads/:id
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
POST /api/internal/:owner/:project/threads
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
PATCH /api/internal/:owner/:project/threads/:id
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
DELETE /api/internal/:owner/:project/threads/:id
```

### Response

#### Status code and headers

```
Status: 204 No Content
```
