## <a name="resource-build"></a>Build

FIXME

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when build was created | `"2015-01-01T12:00:00Z"` |
| **id** | *uuid* | unique identifier of build | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | unique name of build | `"example"` |
| **updated_at** | *date-time* | when build was updated | `"2015-01-01T12:00:00Z"` |

### Build Create

Create a new build.

```
POST /builds
```


#### Curl Example

```bash
$ curl -n -X POST /builds \
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
  "name": "example",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### Build Delete

Delete an existing build.

```
DELETE /builds/{build_id_or_name}
```


#### Curl Example

```bash
$ curl -n -X DELETE /builds/$BUILD_ID_OR_NAME \
  -H "Content-Type: application/json" \
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### Build Info

Info for existing build.

```
GET /builds/{build_id_or_name}
```


#### Curl Example

```bash
$ curl -n /builds/$BUILD_ID_OR_NAME
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### Build List

List existing builds.

```
GET /builds
```


#### Curl Example

```bash
$ curl -n /builds
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
    "name": "example",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```

### Build Update

Update an existing build.

```
PATCH /builds/{build_id_or_name}
```


#### Curl Example

```bash
$ curl -n -X PATCH /builds/$BUILD_ID_OR_NAME \
  -H "Content-Type: application/json" \
 \
  -d '{
}'
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "name": "example",
  "updated_at": "2015-01-01T12:00:00Z"
}
```


