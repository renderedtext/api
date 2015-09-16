# Test Booster Options API

- [List project test booster options ](#list-project-threads)

## List project test boosters

List all test boosters for the project.

```
GET /api/internal/:owner/:project/test_booster_options
```

### Response

`Status: 200 OK`

```json
[
  {
    "type": "rspec",
    "size": 2,
    "estimated_duration": 312,
    "best_option": false,
    "available_on_current_plan": true,
    "suggested_plan": null,
    "price_diff": null
  },
  {
    "type": "rspec",
    "size": 3,
    "estimated_duration": 290,
    "best_option": false,
    "available_on_current_plan": true,
    "suggested_plan": null,
    "price_diff": null
  },
  {
    "type": "rspec",
    "size": 4,
    "estimated_duration": 200,
    "best_option": true,
    "available_on_current_plan": true,
    "suggested_plan": null,
    "price_diff": null
  },
  {
    "type": "rspec",
    "size": 5,
    "estimated_duration": 199,
    "best_option": false,
    "available_on_current_plan": false,
    "suggested_plan": "pro8",
    "price_diff": 176
  },
  {
    "type": "cucumber",
    "size": 2,
    "estimated_duration": 312,
    "best_option": false,
    "available_on_current_plan": true,
    "suggested_plan": null,
    "price_diff": null
  },
  {
    "type": "cucumber",
    "size": 3,
    "estimated_duration": 290,
    "best_option": true,
    "available_on_current_plan": true,
    "suggested_plan": null,
    "price_diff": null
  },
  {
    "type": "cucumber",
    "size": 4,
    "estimated_duration": 200,
    "best_option": false,
    "available_on_current_plan": false,
    "suggested_plan": "pro8",
    "price_diff": 178
  },
  {
    "type": "cucumber",
    "size": 5,
    "estimated_duration": 199,
    "best_option": false,
    "available_on_current_plan": false,
    "suggested_plan": "pro8",
    "price_diff": 178
  }
]
```