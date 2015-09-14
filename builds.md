# Build Threads API

- [Resource format](#resource-format)
- [Index](#index)
- [Get](#get)

## Resource format

Name      | Type                                        
----------|---------------------------------------------
id        | HashID
status    | string ("pending" / "queued" / "running" / "finished")
threads   | Link

## Index

```
GET .../builds/:id
```

### Example

```
[
  {
    id: "ee79b06a-cfbf-472e-99eb-a3d216c902d5",
    status: "running",
    threads: "https://semaphoreci.com/api/internal/.../builds/ee79b06a-cfbf-472e-99eb-a3d216c902d5/threads"
  },
  {
    id: "bb79b06a-cfbf-472e-99eb-a3d216c902d5",
    status: "pending",
    threads: "https://semaphoreci.com/api/internal/.../builds/bb79b06a-cfbf-472e-99eb-a3d216c902d5/threads"
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
  status: "running",
  threads: "https://semaphoreci.com/api/internal/.../builds/ee79b06a-cfbf-472e-99eb-a3d216c902d5/threads"
}
```
