# SemaphoreCI API v2

# The table of contents
  - <a href="#resource-org">Org</a>
    - <a href="#link-GET-org-/orgs/{(%23%2Fdefinitions%2Forg%2Fdefinitions%2Fidentity)}">GET /orgs/{(%23%2Fdefinitions%2Forg%2Fdefinitions%2Fidentity)}</a>
    - <a href="#link-GET-org-/orgs">GET /orgs</a>
  - <a href="#resource-team">Team</a>
    - <a href="#link-POST-team-/teams">POST /teams</a>
    - <a href="#link-DELETE-team-/teams/{(%23%2Fdefinitions%2Fteam%2Fdefinitions%2Fidentity)}">DELETE /teams/{(%23%2Fdefinitions%2Fteam%2Fdefinitions%2Fidentity)}</a>
    - <a href="#link-GET-team-/teams/{(%23%2Fdefinitions%2Fteam%2Fdefinitions%2Fidentity)}">GET /teams/{(%23%2Fdefinitions%2Fteam%2Fdefinitions%2Fidentity)}</a>
    - <a href="#link-GET-team-/orgs/{(%23%2Fdefinitions%2Forg%2Fdefinitions%2Fidentity)}/teams">GET /orgs/{(%23%2Fdefinitions%2Forg%2Fdefinitions%2Fidentity)}/teams</a>
    - <a href="#link-PATCH-team-/teams/{(%23%2Fdefinitions%2Fteam%2Fdefinitions%2Fidentity)}">PATCH /teams/{(%23%2Fdefinitions%2Fteam%2Fdefinitions%2Fidentity)}</a>
 
## <a name="resource-org">Org</a>

Stability: `prototype`

FIXME

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when org was created | `"2015-01-01T12:00:00Z"` |
| **id** | *uuid* | unique identifier of org | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | name of org | `"example"` |
| **updated_at** | *date-time* | when org was updated | `"2015-01-01T12:00:00Z"` |
| **username** | *string* | unique username of org | `"example"` |

### <a name="link-GET-org-/orgs/{(%23%2Fdefinitions%2Forg%2Fdefinitions%2Fidentity)}">Org Info</a>

Info for existing org.

```
GET /orgs/{org_username}
```


#### Curl Example

```bash
$ curl -n https://api.semaphoreci.com/api/v2/orgs/$ORG_USERNAME
```


#### Response Example

```
HTTP/1.1 200 OK
```

```json
{
  "created_at": "2015-01-01T12:00:00Z",
  "id": "01234567-89ab-cdef-0123-456789abcdef",
  "username": "example",
  "name": "example",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### <a name="link-GET-org-/orgs">Org List</a>

List existing orgs.

```
GET /orgs
```


#### Curl Example

```bash
$ curl -n https://api.semaphoreci.com/api/v2/orgs
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
    "username": "example",
    "name": "example",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```


## <a name="resource-team">Team</a>

Stability: `prototype`

FIXME

### Attributes

| Name | Type | Description | Example |
| ------- | ------- | ------- | ------- |
| **created_at** | *date-time* | when team was created | `"2015-01-01T12:00:00Z"` |
| **id** | *uuid* | unique identifier of team | `"01234567-89ab-cdef-0123-456789abcdef"` |
| **name** | *string* | unique name of team | `"example"` |
| **permission** | *string* | unique name of team<br/> **one of:**`"read"` or `"write"` or `"admin"` | `"admin"` |
| **updated_at** | *date-time* | when team was updated | `"2015-01-01T12:00:00Z"` |

### <a name="link-POST-team-/teams">Team Create</a>

Create a new team.

```
POST /teams
```


#### Curl Example

```bash
$ curl -n -X POST https://api.semaphoreci.com/api/v2/teams \
  -d '{
}' \
  -H "Content-Type: application/json"
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
  "permission": "admin",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### <a name="link-DELETE-team-/teams/{(%23%2Fdefinitions%2Fteam%2Fdefinitions%2Fidentity)}">Team Delete</a>

Delete an existing team.

```
DELETE /teams/{team_id}
```


#### Curl Example

```bash
$ curl -n -X DELETE https://api.semaphoreci.com/api/v2/teams/$TEAM_ID \
  -H "Content-Type: application/json"
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
  "permission": "admin",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### <a name="link-GET-team-/teams/{(%23%2Fdefinitions%2Fteam%2Fdefinitions%2Fidentity)}">Team Info</a>

Info for existing team.

```
GET /teams/{team_id}
```


#### Curl Example

```bash
$ curl -n https://api.semaphoreci.com/api/v2/teams/$TEAM_ID
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
  "permission": "admin",
  "updated_at": "2015-01-01T12:00:00Z"
}
```

### <a name="link-GET-team-/orgs/{(%23%2Fdefinitions%2Forg%2Fdefinitions%2Fidentity)}/teams">Team List</a>

List existing teams.

```
GET /orgs/{org_username}/teams
```


#### Curl Example

```bash
$ curl -n https://api.semaphoreci.com/api/v2/orgs/$ORG_USERNAME/teams
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
    "permission": "admin",
    "updated_at": "2015-01-01T12:00:00Z"
  }
]
```

### <a name="link-PATCH-team-/teams/{(%23%2Fdefinitions%2Fteam%2Fdefinitions%2Fidentity)}">Team Update</a>

Update an existing team.

```
PATCH /teams/{team_id}
```


#### Curl Example

```bash
$ curl -n -X PATCH https://api.semaphoreci.com/api/v2/teams/$TEAM_ID \
  -d '{
}' \
  -H "Content-Type: application/json"
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
  "permission": "admin",
  "updated_at": "2015-01-01T12:00:00Z"
}
```


