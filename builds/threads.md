# Build Threads API

- [Resource format](#resource-format)
- [Index](#index)
- [Get](#get)

## Resource format

Name      | Type                                        
----------|---------------------------------------------
id        | HashID
status    | string ("pending" / "running" / "finished") 
commands  | array of Commands

## Index

```
GET .../builds/:id/threads
```

### Input

Name          | Type         | Description
------------- | -------------|-------------------------------------------------------
with_output   | boolean      | _Required_ Should thread commands contain their output

### Example

```
[
  {
    id: "ee79b06a-cfbf-472e-99eb-a3d216c902d5",
    status: "running",
    commands: [ 
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
  },
  {
    id: "ee79b06a-cfbf-472e-99eb-a3d216c902d5",
    status: "finished",
    commands: [ 
      {
        id: "ee79b06a-cfbf-472e-99eb-a3d216c902d5",
        command: "ls -lah",
        output: "a\nb\n"
        start_time: "2015-05-04 14:16:07 +0000",
        finish_time: "2015-05-04 14:19:07 +0000",
        status: "finished"
      }
    ]
  }
]
```

## Get

```
GET .../builds/:id/threads/:id
```

### Input

Name          | Type         | Description
------------- | -------------|-------------------------------------------------------
with_output   | boolean      | _Required_ Should thread commands contain their output

### Example

``` js
{
  id: "ee79b06a-cfbf-472e-99eb-a3d216c902d5",
  status: "running",
  commands: [ 
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
}
```
