# Commands API

- [Resource format](#resource-format)
- [Index](#index)
- [Get](#get)

## Resource format

Name         | Type                                        
-------------|---------------------------------------------
id           | HashID
command      | string
output       | string
start_time   | DateTime
finish_time  | DateTime
status       | string ("pending" / "running" / "finished")


## Index

```
GET .../builds/:id/threads/:id/commands
```

### Input

Name          | Type         | Description
------------- | -------------|-------------------------------------------------------
with_output   | boolean      | _Required_ Should commands contain their output

### Example

```
[ 
  {
    id: "ee79b06a-cfbf-472e-99eb-a3d216c902d5",
    command: "ls -lah",
    output: "a\nb\n"
    start_time: "2015-05-04 14:16:07 +0000",
    finish_time: "2015-05-04 14:19:07 +0000",
    status: "finished"
  },
  {
    id: "e179b06a-cfbf-472e-99eb-a3d216c902d5",
    command: "ls -lah",
    output: nil
    start_time: "2015-05-04 14:16:07 +0000",
    finish_time: nil,
    status: "running"
  },
  {
    id: "e279b06a-cfbf-472e-99eb-a3d216c902d5",
    command: "ls -lah",
    output: nil
    start_time: nil,
    finish_time: nil,
    status: "pending"
  }
]
```

## Get

```
GET .../builds/:id/threads/:id/commands/:id
```

### Input

Name          | Type         | Description
------------- | -------------|-------------------------------------------------------
with_output   | boolean      | _Required_ Should command contain its output

### Example

``` js
{
  id: "e279b06a-cfbf-472e-99eb-a3d216c902d5",
  command: "ls -lah",
  output: nil
  start_time: nil,
  finish_time: nil,
  status: "pending"
}
```
