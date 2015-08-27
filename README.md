
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
    "id": 2,
    "name": "RSpec",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/threads/2",
    "type": "turbo_thread",
    "turbo_thread_options": {
      "size": 4,
      "turbo_type": "rspec"
    },
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z",
    "commands": []
  },
  {
    "id": 9383,
    "name": "RSpec 123/123",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/threads/9383",
    "type": "build_thread",
    "turbo_thread_options": null,
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
    "turbo_thread_options": null,
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
    "turbo_thread_options": null,
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
    "turbo_thread_options": null,
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
type          | string       | _Required_ Type of thread. Valid options are `setup`, `build_thread`, `post_thread`, `turbo_thread`
commands      | array of strings  | _Required_ Array of commands. Not applicable for `turbo_thread`.
turbo_thread_options | nullable object  | Applicable for `turbo_thread` type. Format `size` - size of turbo thread, `turbo_type` - valid options are `rspec` and `cucumber`.

#### Example

```json
{
  "name": "Rspec 2/4",
  "type": "build_thread",
  "turbo_thread_options": null,
  "commands": [
    "bundle install",
    "bundle exec rspec"
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
    "turbo_thread_options": null,
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
type          | string       | _Required_ Type of thread. Valid options are `setup`, `build_thread`, `post_thread`, `turbo_thread`
commands      | array of strings | _Required_ Array of commands. Not applicable for `turbo_thread`.
turbo_thread_options | nullable object  | Applicable for `turbo_thread` type. Format `size` - size of turbo thread, `turbo_type` - valid options are `rspec` and `cucumber`.

#### Example

```json
{
  "name": "Rspec 2/4",
  "type": "build_thread",
  "turbo_thread_options": null,
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
    "turbo_thread_options": null,
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
