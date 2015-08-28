# Test Boosters API

- [List project test boosters](#list-project-threads)
- [Get](#get)
- [Create](#create)
- [Edit](#edit)
- [Delete](#delete)

## List project turbo threads

List test boosters for the project.

```
GET /api/internal/:owner/:project/test_boosters
```

### Response

`Status: 200 OK`

```json
[
  {
    "id": 9383,
    "type": "rspec",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/test_boosters/9383",
    "size": 4,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  },
  {
    "id": 12,
    "type": "cucumber",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/test_boosters/12",
    "size": 6,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  }
]
```

## Get

```
GET /api/internal/:owner/:project/test_boosters/:id
```
### Response

`Status: 200 OK`

```json
  {
    "id": 9383,
    "type": "rspec",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/test_boosters/9383",
    "size": 4,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  }
```

## Create

```
POST /api/internal/:owner/:project/test_boosters
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
Location: https://semaphoreci.com/api/internal/renderedtext/semaphore_front/test_boosters/123
```

#### Body
```json
  {
    "id": 9383,
    "type": "rspec",
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/test_boosters/9383",
    "size": 4,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  }
```

## Edit

```
PATCH /api/internal/:owner/:project/test_boosters/:id
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
    "url": "https://semaphoreci.com/api/internal/renderedtext/semaphore_front/test_boosters/9383",
    "size": 4,
    "created_at": "2012-01-01T12:00:00Z",
    "updated_at": "2012-01-01T12:00:00Z"
  }
```

## Delete

```
DELETE /api/internal/:owner/:project/test_boosters/:id
```

### Response

#### Status code and headers

```
Status: 204 No Content
```
