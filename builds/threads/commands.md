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
    
  },
  {
    
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
  status: "pending",
  commands: [
    {
    
    },
    {
    
    }
  ]
```
