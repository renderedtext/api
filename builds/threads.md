# Build Threads API

- [Resource format](#resource-format)
- [Index](#index)
- [Get](#get)


## Resource format

Name      | Type                                        
----------|---------------------------------------------
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
    
  },
  {
    
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
  status: "pending",
  commands: [
    {
    
    },
    {
    
    }
  ]
```
