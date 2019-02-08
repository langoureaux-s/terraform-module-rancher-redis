# terraform-module-rancher-redis

This module permit to deploy Kibana stack on Rancher 1.6.x.

```
terragrunt = {
  terraform {
    source = "git::https://github.com/langoureaux-s/terraform-module-rancher-redis.git"
  }
  
  project_name            = "test"
  stack_name              = "redis"
  finish_upgrade          = "true"
  label_global_scheduling = "redis=true"
  data_path               = "/data/redis"
  max_memory              = "1000000000"
}
```

> Don't forget to read the file `variables.tf` to get all informations about variables.