# Build Threads API

- [Resource format](#resource-format)
- [Index](#index)
- [Get](#get)

## Resource format

Name      | Type                                        
----------|---------------------------------------------
id        | HashID
status    | string ("pending" / "queued" / "running" / "finished")

## Index

```
GET .../builds/:id
```

### Example

```
[
  {
    id: "ee79b06a-cfbf-472e-99eb-a3d216c902d5",
    status: "running"
  },
  {
    id: "bb79b06a-cfbf-472e-99eb-a3d216c902d5",
    status: "pending"
  }
]
```

## Get

```
GET .../builds/:id
```

### Example

```
{
  id: "ee79b06a-cfbf-472e-99eb-a3d216c902d5",
  status: "running"
}
```
